using api_snapsign.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace api_snapsign.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly List<DocumentM> _documents = new List<DocumentM>(); 

        [HttpPost]
        public IActionResult UploadDocument([FromBody] DocumentM document)
        {
            if (document == null)
            {
                return BadRequest();
            }
            document.Id = Guid.NewGuid().ToString();
            _documents.Add(document);
            return Ok(document);
        }
        [HttpPut("{document_id}")]
        public IActionResult EditDocument(string document_id, [FromBody] DocumentM document)
        {
            var existingDocument = _documents.FirstOrDefault(d => d.Id == document_id);
            if (existingDocument == null)
            {
                return NotFound();
            }
            existingDocument.Title = document.Title;
            return Ok(existingDocument);
        }

        [HttpDelete("{document_id}")]
        public IActionResult DeleteDocument(string document_id)
        {
            var document = _documents.FirstOrDefault(d => d.Id == document_id);
            if (document == null)
            {
                return NotFound();
            }
            _documents.Remove(document);
            return NoContent();
        }
    }
}