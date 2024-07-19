using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VEGEFOODS.Models
{
    [Table("Users")]
    public class User : ModelBase
    {
        [Key]
        public int USE_ID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string? LastName { get; set; }
        public string? FirstName { get; set; }
        public string? Email { get; set; }

    }
}
