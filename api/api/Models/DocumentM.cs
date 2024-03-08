namespace api.Models
{
    public class DocumentM
    {
        public int DocumentId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime UploadDate { get; set; }
        public string Status { get; set; }
    }
}
