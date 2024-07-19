using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using VEGEFOODS.Models;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace VEGEFOODS.Pages
{
	public class ProductDetailModel : PageModel
	{
		private readonly VGFoodContext _context;
		public List<Product> RelatedProducts { get; set; }
		public Product Product { get; set; }

		public ProductDetailModel(VGFoodContext context)
		{
			_context = context;
		}

		public void OnGet(int id)
		{
			Product = _context.Products
				.Include(p => p.Category)
				.FirstOrDefault(p => p.PRO_ID == id);
			if (Product != null)
			{
				RelatedProducts = _context.Products
					.Where(p => p.CAT_ID == Product.CAT_ID && p.PRO_ID != id)
					.ToList();
			}
		}
	}
}
