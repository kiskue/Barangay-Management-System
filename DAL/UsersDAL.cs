using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;
using Dapper;

namespace DAL
{
    public class UsersDAL
    {    

        public static Users CheckLogin(Users Obj)
        {
            string sqlQuery = "SELECT Username, Password FROM Users WHERE (Username = @Username) AND (Password = @Password)";

            using (var con = ConnectionUtil.GetConnection())
            {
                return con.Query<Users>(sqlQuery, Obj).FirstOrDefault();
            }
        }
    }
}
