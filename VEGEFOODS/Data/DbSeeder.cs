using Microsoft.AspNetCore.Identity;
using VEGEFOODS.Models;

namespace test.Data
{
    public static class DbSeeder
    {
        public static void Seed(VGFoodContext context,
                  UserManager<IdentityUser> userManager,
                  RoleManager<IdentityRole> roleManager)
        {
            {
                // Look for any Users
                if (context.Users.Any())
                {
                    return; // DB has been seeded
                }

                // Create Roles
                if (!roleManager.RoleExistsAsync("NormalUser").Result)
                {
                    var role = new IdentityRole
                    {
                        Name = "NormalUser"
                    };
                    IdentityResult roleResult = roleManager.CreateAsync(role).Result;
                }

                if (!roleManager.RoleExistsAsync("Administrator").Result)
                {
                    var role = new IdentityRole
                    {
                        Name = "Administrator"
                    };
                    IdentityResult roleResult = roleManager.CreateAsync(role).Result;
                }

                // Create Users
                if (userManager.FindByNameAsync("admin").Result == null)
                {
                    var adminUser = new IdentityUser
                    {
                        Id = Guid.NewGuid().ToString(),
                        Email = "admin444@gmail.com",
                        NormalizedEmail = "admin444@gmail.com".ToUpper(),
                        UserName = "admin",
                        NormalizedUserName = "admin".ToUpper(),
                        EmailConfirmed = false,
                        PhoneNumberConfirmed = false,
                        LockoutEnabled = false,
                        SecurityStamp = Guid.NewGuid().ToString()
                    };

                    IdentityResult result = userManager.CreateAsync(adminUser, "123456").Result;
                    if (result.Succeeded)
                    {
                        userManager.AddToRoleAsync(adminUser, "Administrator").Wait();
                    }
                }
            }
           
            context.SaveChanges();
        }
    }
}
