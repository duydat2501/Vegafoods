namespace VEGEFOODS.Models
{
    public class ModelBase
    {
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public int CreatedBy { get; set; }
        public DateTime UpdatedDate { get; set; } = DateTime.Now;
        public int UpdatedBy { get; set;}
    }
}
