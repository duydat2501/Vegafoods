using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using VEGEFOODS.Models;

namespace VEGEFOODS.Pages.Admin.Banner
{
    public class EditModel(VGFoodContext context, IWebHostEnvironment environment) : PageModel
    {
        private readonly VGFoodContext _context = context;
        private readonly IWebHostEnvironment _env= environment;
        [FromRoute]
        public int? Id { get; set; }

        [BindProperty]
        public Models.Banner? Banner { get; set; }

        [DataType(DataType.Upload)]
        [FileExtensions(Extensions ="png,jpg,jpeg,gif,svg")]
        [BindProperty]
        public IFormFile? Avatar { get; set; }
       
        public void OnGet()
        {          
            if (Id.HasValue)
            {
                Banner = _context.Banners.AsNoTracking().FirstOrDefault(x => x.BAN_ID == Id.Value);
            }
        }
        public void OnPost()
        {
            //image upload
            var newFileName = "";
            if (Avatar != null)
            {
                newFileName = $"{DateTime.Now.ToFileTime()}_{Avatar.FileName}";
                var file = Path.Combine(_env.WebRootPath, "Data", "Banners", newFileName);
                using (var fileStream = new FileStream(file, FileMode.Create))
                {
                    Avatar.CopyTo(fileStream);
                }
            }
            if (!Id.HasValue)
            {
                if (!string.IsNullOrEmpty(newFileName)) Banner!.Image = newFileName;
                _context.Banners.Add(Banner!);
            }
            else
            {
                var updateData = _context.Banners.FirstOrDefault(x => x.BAN_ID == Id.Value);
                if (updateData != null)
                {                                  
                    updateData.Title = Banner!.Title;
                    updateData.Url = Banner!.Url;                  
                    updateData.DisplayOrder = Banner!.DisplayOrder;
                    if (!string.IsNullOrEmpty(newFileName)) updateData.Image = newFileName;
                }
            }
            _context.SaveChanges();

           

            Response.Redirect("/Admin/Banner/List");
        }
    }
}
