using System;
using Api.Services;
using Api.Settings;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Serilog;
using Swashbuckle.AspNetCore.Swagger;

namespace Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Warning()
                .WriteTo.File($"{AppContext.BaseDirectory}/Logs/log-.txt", rollingInterval: RollingInterval.Day)
                .WriteTo.Seq(configuration.GetConnectionString("Seq"))
                .CreateLogger();

            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "Users Service", Version = "v1", });
            });

            services.AddCors(options =>
            {
                options.AddPolicy("DefaultPolicy", builder => builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod().AllowCredentials());
            });

            services.Configure<ConnectionStrings>(Configuration.GetSection(nameof(ConnectionStrings)));
            services.AddScoped<IUsersService, UsersService>();
            services.AddScoped<IMeetingService, MeetingService>();
            services.AddScoped<IParticipantService, ParticipantService>();
            services.AddLogging(loggingBuilder => loggingBuilder.AddSerilog(dispose: true));

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            app.UseDefaultFiles()
                .UseStaticFiles();

            app.UseCors("DefaultPolicy")
                .UseHttpsRedirection()
                .UseMvc(routes =>
                {
                    routes.MapRoute(name: "default", template: "api/{controller=Home}/{action=Index}/{id?}");
                });

            app.UseSwagger();

            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
                options.RoutePrefix = "swagger/ui";
            });
        }
    }
}
