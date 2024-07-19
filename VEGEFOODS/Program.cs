using Microsoft.EntityFrameworkCore;
using test.Data;
using VEGEFOODS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Text.Json.Serialization;

namespace VEGEFOODS
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddRazorPages(options =>
            {
                options.Conventions.AuthorizeFolder("/Admin");
                options.Conventions.AllowAnonymousToPage("/Admin/Login");
            }).AddJsonOptions(opt =>
            {
                opt.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
                opt.JsonSerializerOptions.WriteIndented = true;
                //opt.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull; // hide NULL values
                opt.JsonSerializerOptions.PropertyNamingPolicy = null;
            });
            //for DB
            builder.Services.AddDbContext<VGFoodContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("CnString")));

            //builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true).AddEntityFrameworkStores<VEGEFOODSContext>();
            builder.Services.AddIdentity<IdentityUser, IdentityRole>()
                .AddEntityFrameworkStores<VGFoodContext>()
                .AddDefaultTokenProviders();

            builder.Services.Configure<IdentityOptions>(options => {
                // Thi?t l?p v? Password
                options.Password.RequireDigit = false; // Không b?t ph?i có s?
                options.Password.RequireLowercase = false; // Không b?t ph?i có ch? thý?ng
                options.Password.RequireNonAlphanumeric = false; // Không b?t k? t? ð?c bi?t
                options.Password.RequireUppercase = false; // Không b?t bu?c ch? in
                options.Password.RequiredLength = 3; // S? k? t? t?i thi?u c?a password
                options.Password.RequiredUniqueChars = 1; // S? k? t? riêng bi?t

                // C?u h?nh Lockout - khóa user
                options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(30); // Khóa 30 phút
                options.Lockout.MaxFailedAccessAttempts = 5; // Th?t b?i 5 l? th? khóa
                options.Lockout.AllowedForNewUsers = true;

                // C?u h?nh v? User.
                options.User.AllowedUserNameCharacters = // các k? t? ð?t tên user
                    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+";
                options.User.RequireUniqueEmail = true;  // Email là duy nh?t

                // C?u h?nh ðãng nh?p.
                options.SignIn.RequireConfirmedEmail = false;            // C?u h?nh xác th?c ð?a ch? email (email ph?i t?n t?i)
                options.SignIn.RequireConfirmedPhoneNumber = false;     // Xác th?c s? ði?n tho?i
            });
            builder.Services.ConfigureApplicationCookie(options =>
            {
                //options.AccessDeniedPath = "/Admin/AccessDenied";
                options.Cookie.Name = "YourAppCookieName";
                options.Cookie.HttpOnly = true;
                options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
                options.LoginPath = "/Admin/Login";
                // ReturnUrlParameter requires 
                //using Microsoft.AspNetCore.Authentication.Cookies;
                options.ReturnUrlParameter = CookieAuthenticationDefaults.ReturnUrlParameter;
                options.SlidingExpiration = true;
            });
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

			//db seeder
			using (var scope = app.Services.CreateScope())
			{
                var services = scope.ServiceProvider;
                var userManager = services.GetRequiredService<UserManager<IdentityUser>>();
                var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
                var context = services.GetRequiredService<VGFoodContext>();
                context.Database.EnsureCreated();
                DbSeeder.Seed(context, userManager, roleManager);
            }

			app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.MapRazorPages();

            app.Run();
        }
    }
}
