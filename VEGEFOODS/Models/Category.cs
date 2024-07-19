using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VEGEFOODS.Models
{
    [Table("Categories")]
    public class Category : ModelBase
    {
        [Key]
        public int CAT_ID { get; set; }
        public string Name { get; set; }
        public int? DisplayOrder { get; set; }
        public virtual ICollection<Product>? Products { get; set; }
    }
}
