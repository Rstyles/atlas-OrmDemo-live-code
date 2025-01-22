using Common.models;
using Microsoft.EntityFrameworkCore;

namespace EfcDemo.data;

public class FourthWallAcademyContext : DbContext
{
    public DbSet<Student> Student { get; set; }
    public DbSet<Course> Course { get; set; }
    public DbSet<Subject> Subject { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        string connectionString = "server=127.0.0.1;uid=root;database=FourthWallAcademy";
        optionsBuilder.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
    }
}