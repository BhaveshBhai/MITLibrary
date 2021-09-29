using Microsoft.Ajax.Utilities;
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
        public string BarCode { get; set; }
        public int Unit_Id { get; set; }
        [Required]
        public int CampusId { get; set; }
        public string UserName{ get; set; }
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
                    var textBook = db.TextBooks.Where(x => x.Title == bookModel.Title && x.TextBook_Year.ToString() == bookModel.TextBook_Year && x.Publisher==bookModel.Publisher && x.Author==bookModel.Author).FirstOrDefault();
                    var stFieldId = db.StudentEnrollments.Where(x => x.UnitCode_Id == bookModel.Unit_Id).OrderByDescending(y => y.StudentDetail_FileId).FirstOrDefault();
                    //TextBook textBook = new TextBook();
                    Order order = new Order();
                    if (textBook == null)
                    {
                        textBook = new TextBook();
                        textBook.Title = bookModel.Title;
                        //textBook.Year_Id = yearId;
                        textBook.Author = bookModel.Author;
                        textBook.Coordinator_Name = bookModel.Coordinator_Name;
                        textBook.Identifier = bookModel.Identifier;
                        textBook.Publisher = bookModel.Publisher;
                        textBook.Requirement = bookModel.Requirement;
                        textBook.TextBook_Year = Convert.ToInt32(bookModel.TextBook_Year);
                        textBook.UnitCode_Id = bookModel.Unit_Id;
                        db.TextBooks.Add(textBook);
                        db.SaveChanges();
                        order.IsNew = true;
                        order.TextBook_Id = textBook.TextBook_Id;
                    }
                    else
                    {
                        order.IsNew = false;
                        order.TextBook_Id = textBook.TextBook_Id;
                    }
                    order.OrderDate = DateTime.Now;
                    order.Unit_Id = bookModel.Unit_Id;
                    order.UserName = bookModel.UserName;
                    order.FileId = stFieldId.StudentDetail_FileId;
                    db.Orders.Add(order);
                    db.SaveChanges();
                    //AumltInventor aumltInventor = new AumltInventor();
                    //aumltInventor.Inventor_FileUpload_Id = stFieldId.StudentDetail_FileId;
                    //aumltInventor.OCLC_Number = textBook.Identifier;
                    //aumltInventor.TextBookId = textBook.TextBook_Id;
                    //aumltInventor.UnitCode_Id = bookModel.Unit_Id;

                    //aumltInventor.Campus_Id = stFieldId.Campus_Id;
                    //db.AumltInventors.Add(aumltInventor);
                    //db.SaveChanges();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public static List<Report> GetPurchaseOrders()
        {
                    try
                    {
                        List<Report> reports = new List<Report>();
                        Report report = new Report();
                        using (var db = new MITDBContext())
                        {
                             var fileid = db.FileUploads.ToList().OrderByDescending(x => x.File_Upload_Id).FirstOrDefault();
                    var order = db.Orders.Where(x => x.IsNew != true && x.FileId==fileid.File_Upload_Id).ToList();

                    foreach (var item in order)
                            {
                                var Studentresult = db.StudentEnrollments.Where(x => x.UnitCode_Id == item.Unit_Id && x.StudentDetail_FileId == fileid.File_Upload_Id).FirstOrDefault();
                                var lstrp = (from iv in db.AumltInventors
                                             where iv.Inventor_FileUpload_Id == fileid.File_Upload_Id &&  iv.TextBookId == item.TextBook_Id && iv.Campus_Id == Studentresult.Campus_Id
                                             select iv).ToList();
                                foreach (var item1 in lstrp.DistinctBy(x => x.OCLC_Number))
                                {
                                    var Studentresult1 = db.StudentEnrollments.Where(x => x.UnitCode_Id == item1.UnitCode_Id).FirstOrDefault();
                                    Report rp = new Report();
                                    rp.Title = item.TextBook.Title;
                                    rp.OCLC_Number = item1.OCLC_Number;
                                    rp.UnitCode = item.UnitCode.UnitCodeName;
                                    rp.BookPublisher = item.TextBook.Publisher.ToString();
                                    rp.CampusName = item1.Campus.Campus_Name;
                                    rp.AvaibleBook = lstrp.Where(x => x.OCLC_Number == item1.OCLC_Number && x.UnitCode_Id==item.Unit_Id).Count();
                                    rp.ActualRequiredBook = (int)(Studentresult.Total_Enrollment != 0 ? (int)(Math.Ceiling((decimal)Studentresult.Total_Enrollment / 10)) : 0) + 2;

                                    rp.NeedOrder = (rp.AvaibleBook - rp.ActualRequiredBook) > 0 ? 0 : rp.AvaibleBook - rp.ActualRequiredBook;
                            rp.Id = item.OrderId;
                                    reports.Add(rp);
                                }
                            }

                            return reports;
                        }
                    }
                    catch (Exception ex)
                    {
                        return null;
                    }
        }

        public static List<Report> GetLstPurchaseOrders()
        {
            try
            {
                List<Report> reports = new List<Report>();
                Report report = new Report();
                using (var db = new MITDBContext())
                {
                    var fileid = db.FileUploads.ToList().OrderByDescending(x => x.File_Upload_Id).FirstOrDefault();
                    var order = db.Orders.Where(x => x.IsNew == true && x.FileId == fileid.File_Upload_Id).ToList();

                    foreach (var item in order)
                    {
                        var Studentresult = db.StudentEnrollments.Where(x => x.UnitCode_Id == item.Unit_Id && x.StudentDetail_FileId==fileid.File_Upload_Id).FirstOrDefault();
                        var lstrp = (from iv in db.AumltInventors
                                  where iv.Inventor_FileUpload_Id == fileid.File_Upload_Id  && iv.TextBookId == item.TextBook_Id && iv.Campus_Id == Studentresult.Campus_Id 
                                  select iv).ToList();
                        foreach (var item1 in lstrp.DistinctBy(x => x.OCLC_Number))
                        {
                            var Studentresult1 = db.StudentEnrollments.Where(x => x.UnitCode_Id == item1.UnitCode_Id).FirstOrDefault();
                            Report rp = new Report();
                            rp.Title = item.TextBook.Title;
                            rp.OCLC_Number = item1.OCLC_Number;
                            rp.UnitCode = item.UnitCode.UnitCodeName;
                            rp.BookPublisher = item.TextBook.Publisher.ToString();
                            rp.CampusName = item1.Campus.Campus_Name;
                            rp.AvaibleBook = lstrp.Where(x => x.OCLC_Number == item1.OCLC_Number && x.UnitCode_Id==item.Unit_Id).Count();
                            rp.ActualRequiredBook = (int)(Studentresult.Total_Enrollment != 0 ? (int)(Math.Ceiling((decimal)Studentresult.Total_Enrollment / 10)) : 0) + 2;
                            
                            rp.NeedOrder = (rp.AvaibleBook - rp.ActualRequiredBook) > 0 ? 0 : rp.AvaibleBook - rp.ActualRequiredBook;
                            rp.Id = item.OrderId;
                            reports.Add(rp);
                        }
                    }
                    
                    return reports;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static List<Report> GetNewBookPurchseOrders()
        {
            try
            {
                List<Report> reports = new List<Report>();
                Report report = new Report();
                using (var db = new MITDBContext())
                {
                    var fileid = db.FileUploads.ToList().OrderByDescending(x => x.File_Upload_Id).FirstOrDefault();
                    var order = db.Orders.Where(x => x.IsNew == true && x.OrderComplated!=true && x.FileId==fileid.File_Upload_Id).ToList();
                    

                    foreach (var item in order)
                    {
                        var bk = db.TextBooks.Where(x => x.TextBook_Id == item.TextBook_Id).FirstOrDefault();
                        var r1 = (from st in db.StudentEnrollments
                                  join u in db.UnitCodes on st.UnitCode_Id equals u.UnitCodeId
                                  join c in db.Campuses on st.Campus_Id equals c.Campus_id

                                  where st.UnitCode_Id.HasValue == item.Unit_Id.HasValue
                                  select new Report
                                  {
                                      BookPublisher = bk.Publisher,
                                      CampusName = c.Campus_Name,
                                      OCLC_Number = bk.Identifier,
                                      Title = bk.Title,
                                      UnitCode = u.UnitCodeName,
                                      ActualRequiredBook = (int)(st.Total_Enrollment != 0 ? (int)(Math.Ceiling((decimal)st.Total_Enrollment / 10)) : 0) + 2,
                                      AvaibleBook = 0,
                                      Id=item.OrderId,
                                  }).FirstOrDefault();
                        
                        reports.Add(r1);
                    }   
                    return reports;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static PurchaseOrderModel GetBook(int id,int? rq)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    return (from o in db.Orders
                              join Tb in db.TextBooks on o.TextBook_Id equals Tb.TextBook_Id
                              where o.OrderId == id && o.OrderComplated!=true
                              select new PurchaseOrderModel
                              {
                                  Title = Tb.Title,
                                  Author = Tb.Author,
                                  Coordinator_Name = Tb.Coordinator_Name,
                                  Identifier = Tb.Identifier,
                                  Publisher = Tb.Publisher,
                                  Unit_Id = o.Unit_Id.Value,
                                  TextBook_Id = o.TextBook_Id.Value,
                                  FileUploadId = o.FileId.Value,
                                  ActualRequirment=rq.Value,
                                  OrderId=o.OrderId,
                              }).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static void RemoveBook(int bookId)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    var or = db.Orders.Where(x => x.TextBook_Id == bookId).ToList();
                    if (or != null)
                    {
                        db.Orders.RemoveRange(or);
                        db.SaveChanges();
                    }
                    var al = db.AumltInventors.Where(x => x.TextBookId == bookId).ToList();
                    if (al != null)
                    {
                        db.AumltInventors.RemoveRange(al);
                        db.SaveChanges();
                    }
                    var textbook = db.TextBooks.Where(x => x.TextBook_Id == bookId).FirstOrDefault();
                    db.TextBooks.Remove(textbook);
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