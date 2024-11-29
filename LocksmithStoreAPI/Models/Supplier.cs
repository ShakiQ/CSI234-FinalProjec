namespace LocksmithStoreAPI.Models
{
    public class Supplier
    {
        public int SupplierID { get; set; }
        public string Name { get; set; }
        public string ContactInfo { get; set; }

        // Navigation property for related inventory
        public ICollection<Inventory> Inventory { get; set; }
    }
}
