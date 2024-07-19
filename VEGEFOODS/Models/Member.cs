using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VEGEFOODS.Models
{
    [Table("Members")]
    public class Member : ModelBase
    {
        [Key]
        public int MEM_ID { get; set; }
        public string UserName{ get; set; }
        public string Password { get; set; }
        public string? LastName { get; set; }
        public string? FirstName { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }

    }
}
