using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VEGEFOODS.Models
{
    [Table("CartDetails")]
    public class CartDetail
    {
        [Key]
        public int CARD_ID { get; set; }
        public int CAR_ID { get; set; }
        public int PRO_ID { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal? DiscountPrice { get; set; }

        [ForeignKey("PRO_ID")]
        public Product? Product { get; set; }
        [ForeignKey("CAR_ID")]
        public Cart? Cart { get; set; }

    }
}
