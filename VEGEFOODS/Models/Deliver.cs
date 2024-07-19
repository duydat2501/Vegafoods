using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace VEGEFOODS.Models
{
    [Table("DeliveryPersonnel")]
    public class Deliver : ModelBase
    {
        [Key]
        public int DEL_ID { get; set; }
        public string Name { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Address { get; set; }

    }
}
