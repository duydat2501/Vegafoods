using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using VEGEFOODS.Models;

namespace VEGEFOODS.Pages.Admin.Category
{
    public class EditModel(VGFoodContext context) : PageModel
    {
        private readonly VGFoodContext _context = context;
        [FromRoute]
        public int? Id { get; set; }

        [BindProperty]
        public Models.Category? Category { get; set; }
        public void OnGet()
        {
            if (Id.HasValue)
            {
                Category = _context.Categories.AsNoTracking().FirstOrDefault(x => x.CAT_ID == Id.Value);
            }
        }
        public void OnPost()
        {
            if (!Id.HasValue)
            {
                _context.Categories.Add(Category!);
            }
            else
            {
                var updateData = _context.Categories.FirstOrDefault(x => x.CAT_ID == Id.Value);
                if (updateData != null)
                {
                    updateData.Name = Category!.Name;
                    updateData.DisplayOrder = Category!.DisplayOrder;
                }
            }
            _context.SaveChanges();
            Response.Redirect("/Admin/Category/List");
        }
    }
}
