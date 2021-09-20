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

        public List<Report> GetReports (int fileId)
        {
            try
            {
                Report report = new Report();
                using (var db = new MITDBContext())
                {
                    
                    var data = (from iv in db.AumltInventors.DistinctBy(x => x.Unit_Id)
                                join bk in db.TextBooks on iv.TextBookId equals bk.TextBook_Id
                                join c in db.Campuses on iv.Campus_Id equals c.Campus_id
                                join u in db.Units on iv.Unit_Id equals u.Unit_Id
                                where iv.Inventor_FileUpload_Id == fileId
                                select new Report
                                {
                                    BookPublisher = bk.Publisher,
                                    CampusName = c.Campus_Name,
                                    OCLC_Number = iv.OCLC_Number.ToString(),
                                    UnitCode = u.Unit_Code,
                                    AvaibleBook = db.AumltInventors.Where(x => x.Unit_Id == iv.Unit_Id).Count(),
                                    ActualRequiredBook = (int)(u.Total_Enrollment != 0 ? Math.Ceiling((double)u.Total_Enrollment / 10) + 2 : 0),
NeedOrder= (AvaibleBook-ActualRequiredBook)>0?0:AvaibleBook-ActualRequiredBook
                                }).ToList();
                    return data;
                   
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}