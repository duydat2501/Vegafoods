using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace VEGEFOODS.Pages.Admin
{
    public class LogOutModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;

        public LogOutModel(SignInManager<IdentityUser> signInManager)
        {
            _signInManager = signInManager;
        }
        public async Task<IActionResult> OnGetAsync()
        {
            await _signInManager.SignOutAsync();
            return RedirectToPage("/Admin/Login");
        }
    }
}
