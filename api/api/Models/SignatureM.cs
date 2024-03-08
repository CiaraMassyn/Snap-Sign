namespace api.Models
{
    public class SignatureM
    {
        public int SignatureId { get; set; }
        public int UserId { get; set; }
        public int DocumentId { get; set; }
        public DateTime DateSigned { get; set; }
    }
}
