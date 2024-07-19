using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using VEGEFOODS.DTO;

namespace VEGEFOODS.Pages.Admin
{
    public class LoginModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;

        [BindProperty]
        public LoginDTO? Login { get; set; }


        public LoginModel(SignInManager<IdentityUser> signInManager)
        {
            _signInManager = signInManager;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (Login != null)
            {
                var result = await _signInManager.PasswordSignInAsync(Login.UserName, Login.Password, Login.RememberMe, lockoutOnFailure: false);
                if (result.Succeeded)
                {
                    return Redirect("/Admin");
                }
                else
                {
                    ViewData["ErrorMessage"] = "Wrong username or password";
                }
            }

            return Page();
        }
    }
}
