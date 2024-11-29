using Microsoft.AspNetCore.Mvc;
using LocksmithStoreAPI.Data;
using LocksmithStoreAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace LocksmithStoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InventoryController : ControllerBase
    {
        private readonly AppDbContext _context;

        public InventoryController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllInventory()
        {
            var inventory = await _context.Inventory.ToListAsync();
            return Ok(inventory);
        }

        [HttpPost]
        public async Task<IActionResult> AddInventory(Inventory inventory)
        {
            _context.Inventory.Add(inventory);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetAllInventory), new { productId = inventory.ProductID, supplierId = inventory.SupplierID }, inventory);
        }

        [HttpDelete("{productId}/{supplierId}")]
        public async Task<IActionResult> DeleteInventory(int productId, int supplierId)
        {
            var inventory = await _context.Inventory
                .FindAsync(new { ProductID = productId, SupplierID = supplierId });
            if (inventory == null) return NotFound();
            _context.Inventory.Remove(inventory);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
