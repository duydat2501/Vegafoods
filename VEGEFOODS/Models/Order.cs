using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VEGEFOODS.Models
{
    [Table("Orders")]
    public class Order : ModelBase
    {
        [Key]
        public int ORD_ID { get; set; }
        public int USE_ID { get; set; }
        public int MEM_ID { get; set; }
		public int SHIP_ID { get; set; }
		public int DEL_ID { get; set; }
        public DateTime OrderDate { get; set; } = DateTime.Now;
        public string? CustomerLastName { get; set; }
        public string? CustomerFirstName { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public decimal? TotalPrice { get; set; }
        public double? Discount { get; set; }
        public string? PaymentMethod { get; set; }
        public Boolean? IsPaid { get; set; }
        public int? Status { get; set; }

        [ForeignKey("MEM_ID")]
        public Member? Member { get; set; }

		[ForeignKey("SHIP_ID")]
		public Ship? Ship { get; set; }

        [ForeignKey("DEL_ID")]
        public Deliver? Deliver { get; set; }

    }
}
