using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class Report
    {
        public int Id { get; set; }
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
                    foreach (var item in books
    .GroupBy(m => new { m.UnitCode_Id, m.OCLC_Number })
    .Select(group => group.First())  // instead of First you can also apply your logic here what you want to take, for example an OrderBy
    .ToList())
                    {
                        var Studentresult = db.StudentEnrollments.Where(x => x.UnitCode_Id == item.UnitCode_Id && x.StudentDetail_FileId==fileId).FirstOrDefault();
                        Report rp = new Report();
                        rp.Title = item.TextBook.Title;
                        rp.OCLC_Number =item.OCLC_Number!=null? item.OCLC_Number.ToString():null;
                        rp.UnitCode = item.UnitCode.UnitCodeName;
                        rp.BookPublisher = item.TextBook.Publisher.ToString();
                        rp.CampusName = item.Campus.Campus_Name;
                        rp.AvaibleBook = books.Where(x => x.OCLC_Number == item.OCLC_Number).Count();
                        rp.ActualRequiredBook = (int)(Studentresult.Total_Enrollment != 0 ? Math.Ceiling((decimal)(Studentresult.Total_Enrollment / 10)) + 2 : 0);
                        rp.NeedOrder = (rp.AvaibleBook - rp.ActualRequiredBook) > 0 ? 0 : rp.AvaibleBook - rp.ActualRequiredBook;
                        reports.Add(rp);
                    }
                    
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