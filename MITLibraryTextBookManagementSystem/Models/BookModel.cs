using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class BookModel
    {
        public int TextBook_Id { get; set; }
        [Required(ErrorMessage ="Year is required")]
        public string TextBook_Year { get; set; }
        [Required(ErrorMessage = "Author is required")]
        public string Author { get; set; }
        [Required(ErrorMessage = "Title is required")]
        public string Title { get; set; }
        [Required(ErrorMessage = "Publisher is required")]
        public string Publisher { get; set; }
        public string Identifier { get; set; }
        [Required(ErrorMessage = "Requirement is required")]
        public string Requirement { get; set; }
        public string Coordinator_Name { get; set; }
        
        public int Unit_Id { get; set; }
        [Required]
        public int CampusId { get; set; }
        public IEnumerable<SelectListItem> Campus { get; set; }
        public IEnumerable<SelectListItem> Units { get; set; }
        public static IEnumerable<SelectListItem> GetUnitList()
        {
            SelectList lstobj = null;
            try
            {
                using (MITDBContext db = new MITDBContext())
                {
                    var list = db.UnitCodes.Select(x => new SelectListItem
                    {
                        Value = x.UnitCodeId.ToString(),
                        Text = x.UnitCodeName
                    }).ToList();
                    lstobj = new SelectList(list, "Value", "Text");
                }
                return lstobj;
            }
            catch (Exception ex)
            {
                return lstobj;
            }
        }
        public static void AddBook(BookModel bookModel)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    TextBook textBook = new TextBook();
                    textBook.Title = bookModel.Title;
                    //textBook.Year_Id = yearId;
                    textBook.Author = bookModel.Author;
                    textBook.Coordinator_Name = bookModel.Coordinator_Name;
                    textBook.Identifier = bookModel.Identifier;
                    textBook.Publisher = bookModel.Publisher;
                    textBook.Requirement = bookModel.Requirement;
                    textBook.TextBook_Year = Convert.ToInt32(bookModel.TextBook_YearId);
                    textBook.UnitCode_Id = bookModel.Unit_Id;
                    db.TextBooks.Add(textBook);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}