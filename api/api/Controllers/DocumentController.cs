using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using api.Models;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Metadata;
using api.ViewModels;

namespace api.Controllers
{
    [Route("api/documents                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ")]
    [ApiController]
    public class DocumentController : ControllerBase
    {
        private readonly FirestoreDb _firestore;

        public DocumentController()
        {
            _firestore = FirestoreDb.Create("snapsign-6d108");
        }

        //READ DOCUMENTS
        public IActionResult GetDocuments()
        {
            var documents = _firestore.Documents.ToList(); 
            return Ok(documents);
        }

        //READ DOCUMENT
        [HttpGet("{id}")]
        public IActionResult GetDocumentById(int id)
        {
            var document = _firestore.Documents.Find(id);

            if (document == null)
            {
                return NotFound();
            } 

            return Ok(document);
        }

        //CREATE DOCUMENT
        [HttpPost]
        public IActionResult CreateDocument([FromBody] DocumentVM documentVM)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var newDocument = new Document
            {
                Title = documentVM.Title,
                Content = documentVM.Content,
            };

            _firestore.Documents.Add(newDocument);
            _firestore.SaveChanges();

            return CreatedAtAction(nameof(GetDocumentById), new { id = newDocument.DocumentId }, newDocument);
        }

        //UPDATE DOCUMENT
        [HttpPut("{id}")]
        public IActionResult UpdateDocument(int id, [FromBody] DocumentVM updatedDocumentVM)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var existingDocument = _firestore.Documents.Find(id);

            if (existingDocument == null)
                return NotFound();

            // Update properties as needed
            existingDocument.Title = updatedDocumentVM.Title;
            existingDocument.Content = updatedDocumentVM.Content;

            _firestore.SaveChanges();

            return Ok(existingDocument);
        }

        // DELETE DOCUMENT
        [HttpDelete("{id}")]
        public IActionResult DeleteDocument(int id)
        {
            var document = _firestore.Documents.Find(id);

            if (document == null)
                return NotFound();

            _firestore.Documents.Remove(document);
            _firestore.SaveChanges();

            return NoContent();
        }
    }
}
