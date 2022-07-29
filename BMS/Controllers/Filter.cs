using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;

namespace BMS.Models
{
    public class Filter
    {
        public int ID { get; set; }
        [Required(ErrorMessage = "Please enter city name")]
        [Display(Name = "Residence Name")]
        public string ResidenceName { get; set; }
        [Required(ErrorMessage = "Please enter city latitude")]
        public double Latitude { get; set; }
        [Required(ErrorMessage = "Please enter city longitude ")]
        public double Longitude { get; set; }
        public string FamilyMember { get; set; }
        public DataTable DataSource { get; internal set; }

        internal void DataBind()
        {
            throw new NotImplementedException();
        }
    }
}