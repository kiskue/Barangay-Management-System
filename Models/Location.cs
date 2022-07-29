using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BMS.Models
{
    public class Location
    {
        public int ID { get; set; }
        [Required(ErrorMessage = "Please enter city name")]
        [Display(Name = "City Name")]
        public string ResidenceName { get; set; }
        [Required(ErrorMessage = "Please enter city latitude")]
        public double Latitude { get; set; }
        [Required(ErrorMessage = "Please enter city longitude ")]
        public double Longitude { get; set; }
        public string Address { get; set; }
        public string Occupation { get; set; }
        public int Contact { get; set; }
        public int Birthday { get; set; }
        public string Sex { get; set; }
        public string Status { get; set; }
        public string Religion { get; set; }
    }
}