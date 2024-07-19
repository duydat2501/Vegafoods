using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace VEGEFOODS.Pages.Admin.Product
{
    public class ListModel : PageModel
    {
        private readonly Models.VGFoodContext _context;
        public List<Models.Product> data;
        [BindProperty]
        public int? Id { get; set; }
        public ListModel(Models.VGFoodContext context)
        {
            _context = context;
            data = new List<Models.Product>();
        }
        public void OnGet()
        {
            data = _context.Products.Include(x => x.Category).AsNoTracking().ToList();
        }

        public void OnPost()
        {
            if (Id.HasValue)
            {
                var data = _context.Products.FirstOrDefault(x => x.PRO_ID == Id.Value);
                if (data != null)
                {
                    _context.Products.Remove(data);
                    _context.SaveChanges();
                }
            }
            Response.Redirect("/Admin/Product/List");
        }
    }
}
