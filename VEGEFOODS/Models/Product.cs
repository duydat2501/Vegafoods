using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VEGEFOODS.Models
{
    [Table("Products")]
    public class Product : ModelBase
    {
        [Key]
        public int PRO_ID { get; set; } 

        public int CAT_ID { get; set; }  

        public string? Avatar { get; set; }  

        public string Name { get; set; }  

        public string? Intro { get; set; }  

        public decimal? Price { get; set; }  

        public decimal? DiscountPrice { get; set; }
        public string? Unit { get; set; }

        public float? Rate { get; set; }  

        public string? Description { get; set; } 
        
        public string? Details { get; set; }

        [ForeignKey("CAT_ID")]
        public virtual Category? Category { get; set; }
    }
}
