namespace LocksmithStoreAPI.Models
{
    public class Customer
    {
        public int CustomerID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }

        // Navigation property for related orders
        public ICollection<Order> Orders { get; set; }
    }
}
