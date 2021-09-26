using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class Report
    {
        public string UnitCode { get; set; }
        public string CampusName { get; set; }
        public string BookPublisher { get; set; }
        public string OCLC_Number { get; set; }
        public int AvaibleBook { get; set; }
        public int ActualRequiredBook { get; set; }
        public int NeedOrder { get; set; }
        public string Title { get; set; }

        public List<Report> GetReports (int fileId)
        {
            try
            {
                Report report = new Report();
                using (var db = new MITDBContext())
                {
                    var books = (from iv in db.AumltInventors
                                 join uc in db.UnitCodes on iv.UnitCode_Id equals uc.UnitCodeId
                                 join u in db.StudentEnrollments on uc.UnitCodeId equals u.UnitCode_Id
                                 where iv.Inventor_FileUpload_Id == fileId && iv.Campus_Id == u.Campus_Id
                                 select iv).ToList();
                    List<Report> reports = new List<Report>();
                    foreach (var item in books.DistinctBy(x=>x.OCLC_Number))
                    {
                        var Studentresult = db.StudentEnrollments.Where(x => x.UnitCode_Id == item.UnitCode_Id).FirstOrDefault();
                        Report rp = new Report();
                        rp.Title = item.TextBook.Title;
                        rp.OCLC_Number = item.OCLC_Number.ToString();
                        rp.UnitCode = item.UnitCode.UnitCodeName;
                        rp.BookPublisher = item.TextBook.Publisher.ToString();
                        rp.CampusName = item.Campus.Campus_Name;
                        rp.AvaibleBook = books.Where(x => x.OCLC_Number == item.OCLC_Number).Count();
                        rp.ActualRequiredBook = (int)(Studentresult.Total_Enrollment != 0 ? Math.Ceiling((decimal)(Studentresult.Total_Enrollment / 10)) + 2 : 0);
                        reports.Add(rp);
                        NeedOrder = (rp.AvaibleBook - rp.ActualRequiredBook) > 0 ? 0 : rp.AvaibleBook - rp.ActualRequiredBook;

                    }
                    //                    var data = (from iv in db.AumltInventors.DistinctBy(x => x.Unit_Id)
                    //                                join bk in db.TextBooks on iv.TextBookId equals bk.TextBook_Id
                    //                                join c in db.Campuses on iv.Campus_Id equals c.Campus_id
                    //                                join u in db.Units on iv.Unit_Id equals u.Unit_Id
                    //                                where iv.Inventor_FileUpload_Id == fileId && u.Campus_Id==iv.Campus_Id
                    //                                select new Report
                    //                                {
                    //                                    BookPublisher = bk.Publisher,
                    //                                    CampusName = c.Campus_Name,
                    //                                    OCLC_Number = iv.OCLC_Number.ToString(),
                    //                                    UnitCode = u.Unit_Code,
                    //                                    Title=bk.Title,
                    //                                    AvaibleBook = db.AumltInventors.Where(x => x.OCLC_Number.ToString() == bk.Identifier).Count(),
                    //                                    ActualRequiredBook = (int)(u.Total_Enrollment != 0 ? Math.Ceiling((double)u.Total_Enrollment / 10) + 2 : 0),
                    //NeedOrder= (AvaibleBook-ActualRequiredBook)>0?0:AvaibleBook-ActualRequiredBook
                    //                                }).ToList();
                    //                    return data;
                    return reports;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}