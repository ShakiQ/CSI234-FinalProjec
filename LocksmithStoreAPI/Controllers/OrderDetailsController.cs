using Microsoft.AspNetCore.Mvc;
using LocksmithStoreAPI.Data;
using LocksmithStoreAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace LocksmithStoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderDetailsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public OrderDetailsController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllOrderDetails()
        {
            var orderDetails = await _context.OrderDetails.ToListAsync();
            return Ok(orderDetails);
        }

        [HttpGet("{orderId}/{productId}")]
        public async Task<IActionResult> GetOrderDetail(int orderId, int productId)
        {
            var orderDetail = await _context.OrderDetails
                .FindAsync(new { OrderID = orderId, ProductID = productId });
            if (orderDetail == null) return NotFound();
            return Ok(orderDetail);
        }

        [HttpPost]
        public async Task<IActionResult> AddOrderDetail(OrderDetail orderDetail)
        {
            _context.OrderDetails.Add(orderDetail);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetOrderDetail), new { orderId = orderDetail.OrderID, productId = orderDetail.ProductID }, orderDetail);
        }

        [HttpDelete("{orderId}/{productId}")]
        public async Task<IActionResult> DeleteOrderDetail(int orderId, int productId)
        {
            var orderDetail = await _context.OrderDetails
                .FindAsync(new { OrderID = orderId, ProductID = productId });
            if (orderDetail == null) return NotFound();
            _context.OrderDetails.Remove(orderDetail);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
