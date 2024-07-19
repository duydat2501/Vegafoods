using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using VEGEFOODS.Models;

namespace VEGEFOODS.Pages
{
    public class ShopModel : PageModel
    {
        private readonly VGFoodContext _context;
        public List<Category> Categories { get; set; } = [];
        public List<Product> NewProducts { get; set; } = [];
        public ShopModel(VGFoodContext context)
        {
            _context = context;
        }

        public void OnGet()
        {
            Categories = _context.Categories.AsNoTracking().Include(c => c.Products).OrderBy(x => x.DisplayOrder).ToList();
            NewProducts = _context.Products.AsNoTracking().Include(x => x.Category).OrderByDescending(x => x.CreatedDate).ToList();         
        }
    }
}
