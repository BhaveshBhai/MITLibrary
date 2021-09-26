using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class PurchaseOrderModel
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
        public static void AddBookIntoTable(PurchaseOrderModel purchaseOrderModel)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    var bk = db.TextBooks.Where(x => x.TextBook_Id == purchaseOrderModel.TextBook_Id).FirstOrDefault();
                    bk.Identifier = purchaseOrderModel.Identifier;
                    db.TextBooks.Attach(bk);
                    db.Entry(bk).State = EntityState.Modified;
                    db.SaveChanges();
                    var cpId = db.StudentEnrollments.Where(x => x.UnitCode_Id == purchaseOrderModel.Unit_Id).Select(x => x.Campus_Id).FirstOrDefault();
                    for (int i = 0; i < purchaseOrderModel.ActualRequirment; i++)
                    {
                        AumltInventor aumltInventor = new AumltInventor();
                        aumltInventor.OCLC_Number =purchaseOrderModel.Identifier;
                        aumltInventor.TextBookId = purchaseOrderModel.TextBook_Id;
                        aumltInventor.UnitCode_Id = purchaseOrderModel.Unit_Id;
                        aumltInventor.Campus_Id = cpId;
                        aumltInventor.Inventor_FileUpload_Id = purchaseOrderModel.FileUploadId;
                        db.AumltInventors.Add(aumltInventor);
                        db.SaveChanges();

                        var order = db.Orders.Where(x => x.OrderId == purchaseOrderModel.OrderId).FirstOrDefault();
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