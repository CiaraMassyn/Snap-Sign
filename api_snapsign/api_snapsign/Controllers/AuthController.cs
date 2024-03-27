using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Google.Cloud.Firestore;
using FirebaseAdmin.Auth;
using api_snapsign.Models;

namespace api_snapsign.Controllers
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly FirebaseAuth firebaseAuth;
        private readonly Random random;

        public AuthController()
        {
            firebaseAuth = FirebaseAuth.DefaultInstance;
            random = new Random();
        }

        [HttpPost("login")]
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

        [HttpPost("signup")]
        public async Task<IActionResult> SignUp([FromBody] SignUpM model)
        {
            try
            {
                UserRecord user = await firebaseAuth.CreateUserAsync(new UserRecordArgs
                {
                    Email = model.Email,
                    Password = model.Password
                });

                return Ok(new { message = "User created successfully", userId = user.Uid });
            }
            catch (FirebaseAuthException ex)
            {
                return BadRequest(new { error = "Failed to create user" });
            }
        }

        [HttpPost("forgotpassword/sendotp")]
        public IActionResult SendOTP([FromBody] ForgotPasswordM model)
        {
            try
            {
                string otp = GenerateOTP();

                return Ok(new { message = "OTP sent successfully", otp });
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = "Failed to send OTP" });
            }
        }


        [HttpPost("forgotpassword/reset")]
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

        private string GenerateOTP()
        {
            const int otpLength = 6;
            const string chars = "0123456789";
            return new string(Enumerable.Repeat(chars, otpLength)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}
