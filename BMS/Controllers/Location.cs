
using System.ComponentModel.DataAnnotations;

namespace BMS.Controllers
{
    public class Location
    {


        [Key]
        public int? ID { get; set; }
        [Required(ErrorMessage = "Please enter city name")]
        [Display(Name = "Residence Name")]
        public string ResidenceName { get; set; }
        [Required(ErrorMessage = "Please enter city latitude")]
        public double Latitude { get; set; }
        [Required(ErrorMessage = "Please enter city longitude ")]
        public double Longitude { get; set; }
        public string Address { get; set; }
        public string Occupation { get; set; }
        public string Contact { get; set; }
        public string Birthday { get; set; }
        public string Sex { get; set; }
        public string Religion { get; set; }
        public string Status { get; set; }
        public string Other { get; set; }
        public string NationalId { get; set; }
        public string Voter { get; set; }
        public string Barangay { get; set; }

    }
}