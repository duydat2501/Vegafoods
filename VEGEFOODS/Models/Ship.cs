using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using VEGEFOODS.Models;

namespace VEGEFOODS.Models
{
    [Table("Shipping")]
    public class Ship : ModelBase
	{
        [Key]
        public int SHIP_ID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }     
    }
}
