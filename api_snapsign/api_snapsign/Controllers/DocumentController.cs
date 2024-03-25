using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Google.Cloud.Firestore;
using System.Reflection.Metadata;

namespace api_snapsign.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DocumentController : ControllerBase
    {
        private readonly FirestoreDb _firestoreDb;

        public DocumentController()
        {
            _firestoreDb = FirestoreDb.Create("snapsign-6d108");
        }

        [HttpPost]
        public async Task<IActionResult> CreateDocument(Document document)
        {
            try
            {
                var collection = _firestoreDb.Collection("documents");
                var documentReference = await collection.AddAsync(document);

                return Ok(new { id = documentReference.Id });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = "Internal server error" });
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetDocument(string id)
        {
            try
            {
                var snapshot = await _firestoreDb.Collection("documents").Document(id).GetSnapshotAsync();
                if (!snapshot.Exists)
                    return NotFound();

                var document = snapshot.ConvertTo<Document>();
                return Ok(document);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = "Internal server error" });
            }
        }
    }
}
