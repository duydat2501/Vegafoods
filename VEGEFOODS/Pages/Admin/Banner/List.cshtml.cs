using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace VEGEFOODS.Pages.Admin.Banner
{
    public class ListModel : PageModel
    {
        private readonly Models.VGFoodContext _context;
        public List<Models.Banner> data;
        [BindProperty]
        public int? Id { get; set; }
        public ListModel(Models.VGFoodContext context)
        {
            _context = context;
            data = new List<Models.Banner>();
        }
        public void OnGet()
        {
            data = _context.Banners.ToList();
        }

        public void OnPost()
        {
            if (Id.HasValue)
            {
                var data = _context.Banners.FirstOrDefault(x => x.BAN_ID == Id.Value);
                if (data != null)
                {
                    _context.Banners.Remove(data);
                    _context.SaveChanges();
                }
            }
            Response.Redirect("/Admin/Banner/List");
        }
    }
}
