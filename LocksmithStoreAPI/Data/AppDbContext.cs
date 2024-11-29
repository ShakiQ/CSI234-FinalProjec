using Microsoft.EntityFrameworkCore;
using LocksmithStoreAPI.Models;

namespace LocksmithStoreAPI.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Supplier> Suppliers { get; set; }
        public DbSet<Inventory> Inventory { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<OrderDetail>().HasKey(od => new { od.OrderID, od.ProductID });
            modelBuilder.Entity<Inventory>().HasKey(i => new { i.ProductID, i.SupplierID });
        }
    }
}
