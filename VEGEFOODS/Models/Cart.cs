using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VEGEFOODS.Models
{
    [Table("Carts")]
    public class Cart : ModelBase
    {
        [Key]
        public int CAR_ID { get; set; }
        public int USE_ID { get; set; }
        public int MEM_ID { get; set; }
        public DateTime CartDate { get; set; }
        public string? CustomerName { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public decimal? TotalPrice { get; set; }
        public double? Discount { get; set; }
        public string? PaymentMethod { get; set; }
        public string? Note { get; set; }
        public int Status { get; set; }

        [ForeignKey("MEM_ID")]
        public Member? Member { get; set; }

    }
}
