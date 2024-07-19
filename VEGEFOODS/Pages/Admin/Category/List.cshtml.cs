using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace VEGEFOODS.Pages.Admin.Category
{
    public class ListModel : PageModel
    {
        private readonly Models.VGFoodContext _context;
        public List<Models.Category> data;
        [BindProperty]
        public int? Id { get; set; }
        public ListModel(Models.VGFoodContext context)
        {
            _context = context;
            data = new List<Models.Category>();
        }
        public void OnGet()
        {
            data = _context.Categories.OrderBy(x => x.DisplayOrder).ToList();
        }

        public void OnPost()
        {
            if (Id.HasValue)
            {
                var data = _context.Categories
                                    .FirstOrDefault(x => x.CAT_ID == Id.Value);
                if (data != null)
                {
                    _context.Categories.Remove(data);
                    _context.SaveChanges();
                }
            }
            Response.Redirect("/Admin/Category/List");
        }
    }
}
