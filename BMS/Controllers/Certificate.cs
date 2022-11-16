
using System.ComponentModel.DataAnnotations;

namespace BMS.Models
{
    public class Certificate
    {
        [Key]
        public int? ID { get; set; }
        [Required(ErrorMessage = "Please enter city name")]
        [Display(Name = "Residence Name")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Please enter city latitude")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please enter city longitude ")]
        public int Number{ get; set; }
        public string StreetNum { get; set; }
        public string Purok { get; set; }
        public string Purpose { get; set; }
        public string Day { get; set; }
        public string Month { get; set; }
        public int Year { get; set; }
        
    }
}