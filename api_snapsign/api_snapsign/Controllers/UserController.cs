using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Google.Cloud.Firestore;
using FirebaseAdmin.Auth;
using api_snapsign.Models;

namespace api_snapsign.Controllers
{
    [Route("api/user")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly FirebaseAuth firebaseAuth;
        private readonly Random random;
        private readonly List<UserM> _users; 

        public UserController()
        {
            firebaseAuth = FirebaseAuth.DefaultInstance;
            random = new Random();
            _users = new List<UserM>();
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] LoginM model)
        {
            try
            {
                var user = await firebaseAuth.GetUserByEmailAsync(model.email);

                return Ok(new { message = "Login successful", userId = user.Uid });
            }
            catch (FirebaseAuthException ex)
            {
                return Unauthorized(new { error = "Invalid email or password" });
            }
        }

        [HttpPost("ResetPassword")]
        public async Task<IActionResult> ResetPassword([FromBody] ForgotPasswordM model)
        {
            try
            {
                return Ok(new { message = "Password reset process initiated" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = "Failed to reset password" });
            }
        }

        [HttpPost("SignUp")]
        public async Task<IActionResult> SignUp([FromBody] SignUpM model)
        {
            try
            {
                UserRecord user = await firebaseAuth.CreateUserAsync(new UserRecordArgs
                {
                    Email = model.Email,
                    Password = model.Password,
                });

                return Ok(new { message = "User created successfully", userId = user.Uid });
            }
            catch (FirebaseAuthException ex)
            {
                Console.WriteLine($"FirebaseAuthException: {ex.Message}");
                return BadRequest(new { error = "Failed to create user" });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
                return StatusCode(500, new { error = "Internal server error" });
            }
        }

        [HttpGet("GetUserById/{id}")]
        public IActionResult GetUserById(int id)
        {
            var user = _users.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpPut("Update/{id}")]
        public IActionResult UpdateUser(int id, [FromBody] UserM user)
        {
            var existingUser = _users.FirstOrDefault(u => u.Id == id);
            if (existingUser == null)
            {
                return NotFound();
            }
            existingUser.Name = user.Name;
            existingUser.Email = user.Email;
            return NoContent();
        }

        [HttpDelete("Delete/{id}")]
        public IActionResult DeleteUser(int id)
        {
            var user = _users.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                return NotFound();
            }
            _users.Remove(user);
            return NoContent();
        }
    }
}
