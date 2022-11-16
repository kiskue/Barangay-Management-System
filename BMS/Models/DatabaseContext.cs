using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace BMS.Models
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext() : base("DBCS")
        {

        }
       // public DbSet<GoogleMap> GoogleMap { get; set; }
    }
}