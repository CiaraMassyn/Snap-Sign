namespace api_snapsign.Models
{
    public class ForgotPasswordM
    {
        internal readonly string Password;

        public string Email { get; set; }
        public string OTP { get; set; }
    }
}
