namespace LocksmithStoreAPI.Models
{
    public class Product
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int CategoryID { get; set; }
        public int StockLevel { get; set; }
        public int ReorderLevel { get; set; }

        public Category Category { get; set; }
    }
}
