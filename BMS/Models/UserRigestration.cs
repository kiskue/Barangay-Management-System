using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace BMS.Models
{
    public class UserRigestration
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "Full Name is requierd")]
        public string FullName { get; set; }
      
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email ID is requierd")]
        public string Email { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Number is requierd")]
        public int Number { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Address is requierd")]
        public string Address { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Password is requierd")]
        [DataType(DataType.Password)]
        [MinLength(8, ErrorMessage = "Need min 8 character")]
        [RegularExpression(@"^([a-zA-Z0-9@*#]{8,15})$", ErrorMessage = "Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase      Alphabet, 1 Number and 1 Special Character")]
        public string Password { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Confirm Password is requierd")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Confirm Password should match with Password")]
        public string ConfirmPassword { get; set; }
    }
}