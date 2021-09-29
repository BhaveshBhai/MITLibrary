using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class AddBookRequestModel
    {
        public int TextBook_Id { get; set; }
        [Required(ErrorMessage = "Year is required")]
        public string TextBook_Year { get; set; }
        [Required(ErrorMessage = "Author is required")]
        public string Author { get; set; }
        [Required(ErrorMessage = "Title is required")]
        public string Title { get; set; }
        [Required(ErrorMessage = "Publisher is required")]
        public string Publisher { get; set; }
        [Required(ErrorMessage = "Identifier is required")]
        public string Identifier { get; set; }
        [Required(ErrorMessage = "Requirement is required")]
        public string Requirement { get; set; }
        public string Coordinator_Name { get; set; }
        public int ActualRequirment { get; set; }
        public int Unit_Id { get; set; }
        [Required]
        public int CampusId { get; set; }
        public string UserName { get; set; }
        public int FileUploadId { get; set; }
        public int OrderId { get; set; }
        public static void AddBookIntoTable(AddBookRequestModel AddBookRequestModel)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    var bk = db.TextBooks.Where(x => x.TextBook_Id == AddBookRequestModel.TextBook_Id).FirstOrDefault();
                    bk.Identifier = AddBookRequestModel.Identifier;
                    db.TextBooks.Attach(bk);
                    db.Entry(bk).State = EntityState.Modified;
                    db.SaveChanges();
                    var cpId = db.StudentEnrollments.Where(x => x.UnitCode_Id == AddBookRequestModel.Unit_Id).Select(x => x.Campus_Id).FirstOrDefault();
                    for (int i = 0; i < AddBookRequestModel.ActualRequirment; i++)
                    {
                        AumltInventor aumltInventor = new AumltInventor();
                        aumltInventor.OCLC_Number =AddBookRequestModel.Identifier;
                        aumltInventor.TextBookId = AddBookRequestModel.TextBook_Id;
                        aumltInventor.UnitCode_Id = AddBookRequestModel.Unit_Id;
                        aumltInventor.Campus_Id = cpId;
                        aumltInventor.Inventor_FileUpload_Id = AddBookRequestModel.FileUploadId;
                        db.AumltInventors.Add(aumltInventor);
                        db.SaveChanges();

                        var order = db.Orders.Where(x => x.OrderId == AddBookRequestModel.OrderId).FirstOrDefault();
                        order.OrderComplated = true;
                        order.UpdateDate = DateTime.Now;
                        db.Orders.Add(order);
                        db.Entry(order).State = EntityState.Modified;
                        db.SaveChanges();

                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}