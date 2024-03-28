using Microsoft.AspNetCore.Mvc;
using Google.Cloud.Firestore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api_snapsign.Models;

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
        public async Task<IActionResult> CreateDocument([FromBody] DocumentM document)
        {
            try
            {
                if (document == null)
                    return BadRequest("Invalid document data");

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
                if (string.IsNullOrEmpty(id))
                    return BadRequest("Invalid document ID");

                var document = await GetDocumentById(id);
                if (document == null)
                    return NotFound();

                return Ok(document);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = "Internal server error" });
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDocument(string id, [FromBody] DocumentM document)
        {
            try
            {
                if (document == null || string.IsNullOrEmpty(id))
                    return BadRequest("Invalid document data or ID");

                var documentRef = _firestoreDb.Collection("documents").Document(id);
                await documentRef.SetAsync(document);

                return Ok(new { message = "Document updated successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = "Internal server error" });
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDocument(string id)
        {
            try
            {
                if (string.IsNullOrEmpty(id))
                    return BadRequest("Invalid document ID");

                var documentRef = _firestoreDb.Collection("documents").Document(id);
                await documentRef.DeleteAsync();

                return Ok(new { message = "Document deleted successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = "Internal server error" });
            }
        }

        [HttpGet("search")]
        public async Task<IActionResult> SearchDocuments([FromQuery] string query)
        {
            try
            {
                if (string.IsNullOrEmpty(query))
                    return BadRequest("Invalid search query");

                var collection = _firestoreDb.Collection("documents");
                var querySnapshot = await collection.WhereEqualTo("Title", query).GetSnapshotAsync();

                var documents = querySnapshot.Documents.Select(doc => doc.ConvertTo<DocumentM>());

                return Ok(documents);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = "Internal server error" });
            }
        }

        private async Task<DocumentM> GetDocumentById(string id)
        {
            var snapshot = await _firestoreDb.Collection("documents").Document(id).GetSnapshotAsync();
            if (snapshot.Exists)
                return snapshot.ConvertTo<DocumentM>();
            else
                return null;
        }
    }
}
