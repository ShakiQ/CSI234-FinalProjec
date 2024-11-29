namespace LocksmithStoreAPI.Models
{
    public class Category
    {
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }

        // Navigation property for related products
        public ICollection<Product> Products { get; set; }
    }
}
