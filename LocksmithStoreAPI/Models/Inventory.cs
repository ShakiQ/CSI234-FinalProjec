namespace LocksmithStoreAPI.Models
{
    public class Inventory
    {
        public int ProductID { get; set; }
        public int SupplierID { get; set; }
        public int QuantityReceived { get; set; }
        public DateTime LastRestockDate { get; set; } = DateTime.Now;

        // Navigation properties
        public Product Product { get; set; }
        public Supplier Supplier { get; set; }
    }
}
