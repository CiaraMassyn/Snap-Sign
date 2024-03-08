using System.Threading.Tasks;
using Firebase.Auth;
using Microsoft.AspNetCore.Mvc;
using api.ViewModels;
using FirebaseAdmin.Auth;

namespace api.Controllers
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly FirebaseAuthProvider _firebaseAuthProvider;

        public AuthController()
        {
            // Replace "your-api-key" with your actual Firebase API key
            _firebaseAuthProvider = new FirebaseAuthProvider(new FirebaseConfig("your-api-key"));
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterViewModel model)
        {
            try
            {
                var auth = await _firebaseAuthProvider.CreateUserWithEmailAndPasswordAsync(model.Email, model.Password, model.Username, true);
                return Ok(new { Token = auth.FirebaseToken });
            }
            catch (Exception ex)
            {
                // Handle registration error
                return BadRequest(new { Message = "Registration failed", Error = ex.Message });
            }
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginViewModel model)
        {
            try
            {
                var auth = await _firebaseAuthProvider.SignInWithEmailAndPasswordAsync(model.Email, model.Password);
                return Ok(new { Token = auth.FirebaseToken });
            }
            catch (FirebaseAuthException ex)
            {
                // Handle login error
                return Unauthorized(new { Message = "Authentication failed", Error = ex.Reason });
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                return BadRequest(new { Message = "Login failed", Error = ex.Message });
            }
        }
    }
}
