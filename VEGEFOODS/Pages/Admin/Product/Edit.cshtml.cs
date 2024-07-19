using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using VEGEFOODS.Models;

namespace VEGEFOODS.Pages.Admin.Product
{
    public class EditModel(VGFoodContext context, IWebHostEnvironment environment) : PageModel
    {
        private readonly VGFoodContext _context = context;
        private readonly IWebHostEnvironment _env= environment;
        [FromRoute]
        public int? Id { get; set; }

        [BindProperty]
        public Models.Product? Product { get; set; }

        [DataType(DataType.Upload)]
        [FileExtensions(Extensions ="png,jpg,jpeg,gif,svg")]
        [BindProperty]
        public IFormFile? Avatar { get; set; }
        public List<Models.Category> Categories { get; set; } = [];
        public void OnGet()
        {
            Categories = _context.Categories.AsNoTracking().OrderBy(x => x.DisplayOrder).ToList();
            if (Id.HasValue)
            {
                Product = _context.Products.AsNoTracking().FirstOrDefault(x => x.PRO_ID == Id.Value);
            }
        }
        public void OnPost()
        {
            //image upload
            var newFileName = "";
            if (Avatar != null)
            {
                newFileName = $"{DateTime.Now.ToFileTime()}_{Avatar.FileName}";
                var file = Path.Combine(_env.WebRootPath, "Data", "Products", newFileName);
                using (var fileStream = new FileStream(file, FileMode.Create))
                {
                    Avatar.CopyTo(fileStream);
                }
            }
            if (!Id.HasValue)
            {
                if (!string.IsNullOrEmpty(newFileName)) Product!.Avatar = newFileName;
                _context.Products.Add(Product!);
            }
            else
            {
                var updateData = _context.Products.FirstOrDefault(x => x.PRO_ID == Id.Value);
                if (updateData != null)
                {
                    updateData.CAT_ID = Product!.CAT_ID;                 
                    updateData.Name = Product!.Name;
                    updateData.Intro = Product!.Intro;
                    updateData.Price = Product!.Price;
                    updateData.DiscountPrice = Product!.DiscountPrice;
                    updateData.Description = Product!.Description;
                    updateData.Unit = Product!.Unit;
                    updateData.Details = Product!.Details;
                    if (!string.IsNullOrEmpty(newFileName)) updateData.Avatar = newFileName;
                }
            }
            _context.SaveChanges();

           

            Response.Redirect("/Admin/Product/List");
        }
    }
}
