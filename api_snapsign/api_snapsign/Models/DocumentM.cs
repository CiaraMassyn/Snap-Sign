namespace api_snapsign.Models
{
    public class DocumentM
    {
        public string Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string OwnerId { get; set; } 
        public DateTime CreatedAt { get; set; }
    }
}
