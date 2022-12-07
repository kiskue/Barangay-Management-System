using BMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Data;



namespace BMS.Controllers
{
    public class RegisterController : Controller
    {
        loginEntities1 objCon = new loginEntities1();
        // GET: Register
        public ActionResult Index()
        {
       
            return View();
        }
    
        public bool IsEmailExists(string eMail)
        {
            var IsCheck = objCon.UserMs.Where(email => email.Email == eMail).FirstOrDefault();
            return IsCheck != null;
        }
        [HttpPost]
        public ActionResult Index(UserM objUsr)
        {
            // email not verified on registration time    
            objUsr.EmailVerification = false;

            var IsExists = IsEmailExists(objUsr.Email);
            if (IsExists)
            {
                ModelState.AddModelError("EmailExists", "Email Already Exists");
                return View("Index");
            }
            //it generate unique code       
            objUsr.ActivetionCode = Guid.NewGuid();
            //password convert    
            objUsr.Password = BMS.Models.encryptPassword.textToEncrypt(objUsr.Password);
            objCon.UserMs.Add(objUsr);
            objCon.SaveChanges();

            SendEmailToUser(objUsr.Email, objUsr.ActivetionCode.ToString());
            var Message = "Registration completed. Please check your Email for verification : " + objUsr.Email;
            ViewBag.Message = Message;

            return View("Registration");
        }
        public void SendEmailToUser(string emailId, string activationCode)
        {
            var GenarateUserVerificationLink = "/Register/UserVerification/" + activationCode;
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, GenarateUserVerificationLink);

            var fromMail = new MailAddress("gerricmeasco360@gmail.com", "Gerric Measco"); // set your email    
            var fromEmailpassword = "auutijagdfbtdsgv"; // Set your password     
            var toEmail = new MailAddress(emailId);

            var smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(fromMail.Address, fromEmailpassword);

            var Message = new MailMessage(fromMail, toEmail);
            Message.Subject = "Registration Completed ";
            Message.Body = "<br/> Your registration completed succesfully." +
                           "<br/> please click on the below link for account verification" +
                           "<br/><br/><a href=" + link + ">" + link + "</a>";
            Message.IsBodyHtml = true;
            smtp.Send(Message);
        }
        public ActionResult UserVerification(string id)
        {
            bool Status = false;

            objCon.Configuration.ValidateOnSaveEnabled = false; // Ignor to password confirmation     
            var IsVerify = objCon.UserMs.Where(u => u.ActivetionCode == new Guid(id)).FirstOrDefault();

            if (IsVerify != null)
            {
                IsVerify.EmailVerification = true;
                objCon.SaveChanges();
                ViewBag.Message = "Email Verification completed";
                Status = true;
            }
            else
            {
                ViewBag.Message = "Invalid Request...Email not verify";
                ViewBag.Status = false;
            }

            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Login(UserLogin LgnUsr)
        {
            var _passWord = BMS.Models.encryptPassword.textToEncrypt(LgnUsr.Password);
            bool Isvalid = objCon.UserMs.Any(x => x.Email == LgnUsr.EmailId && x.EmailVerification == true &&
            x.Password == _passWord);
            if (Isvalid)
            {
                int timeout = LgnUsr.Rememberme ? 60 : 5; // Timeout in minutes, 60 = 1 hour.    
                var ticket = new FormsAuthenticationTicket(LgnUsr.EmailId, false, timeout);
                string encrypted = FormsAuthentication.Encrypt(ticket);
                var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encrypted);
                cookie.Expires = System.DateTime.Now.AddMinutes(timeout);
                cookie.HttpOnly = true;
                Response.Cookies.Add(cookie);
                Session["FirstName"] = LgnUsr.EmailId.ToString();
                return RedirectToAction("Index", "UserDash");
            }
            else
            {
                ModelState.AddModelError("", "Invalid Information... Please try again!");
            }
            return View();
        }
        
       
        public ActionResult ForgetPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ForgetPassword(ForgetPassword pass)
        {
            var IsExists = IsEmailExists(pass.EmailId);
            if (!IsExists)
            {
                ModelState.AddModelError("EmailNotExists", "This email is not exists");
                return View();
            }
            var objUsr = objCon.UserMs.Where(x => x.Email == pass.EmailId).FirstOrDefault();

            // Genrate OTP     
            string OTP = GeneratePassword();

            objUsr.ActivetionCode = Guid.NewGuid();
            objUsr.OTP = OTP;
            objCon.Entry(objUsr).State = System.Data.Entity.EntityState.Modified;
            objCon.SaveChanges();

            ForgetPasswordEmailToUser(objUsr.Email, objUsr.ActivetionCode.ToString(), objUsr.OTP);
            var Message = "Please check your Email for Password reset : " + objUsr.Email;
            ViewBag.Message = Message;

            return View("Registration");
        }

        public void ForgetPasswordEmailToUser(string emailId, string activationCode, string OTP)
        {
            var GenarateUserVerificationLink = "/Register/ChangePassword/" + activationCode;
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, GenarateUserVerificationLink);

            var fromMail = new MailAddress("gerricmeasco360@gmail.com", "Gerric Measco"); // set your email    
            var fromEmailpassword = "auutijagdfbtdsgv"; // Set your password     
            var toEmail = new MailAddress(emailId);

            var smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(fromMail.Address, fromEmailpassword);

            var Message = new MailMessage(fromMail, toEmail);
            Message.Subject = "Password Reset";
            Message.Body = "<br/> Your Password Reset." +
                           "<br/> please click on the below link for Password Change" +
                           "<br/><br/><a href=" + link + ">" + link + "</a>" +
                           "<br/> OTP for Password change :" + OTP ;
            Message.IsBodyHtml = true;
            smtp.Send(Message);
        }
        public string GeneratePassword()
        {
            string OTPLength = "4";
            string OTP = string.Empty;

            string Chars = string.Empty;
            Chars = "1,2,3,4,5,6,7,8,9,0";

            char[] seplitChar = { ',' };
            string[] arr = Chars.Split(seplitChar);
            string NewOTP = "";
            string temp = "";
            Random rand = new Random();
            for (int i = 0; i < Convert.ToInt32(OTPLength); i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                NewOTP += temp;
                OTP = NewOTP;
            }
            return OTP;
        }
 

        public ActionResult ChangePassword()
        {
            return View();
        }
    }
}