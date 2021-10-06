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
        public string Author { get; set; }
        public int? TextBook_Year { get; set; }
        public List<Report> GetReports (int fileId)
        {
            try
            {
                Report report = new Report();
                using (var db = new MITDBContext())
                {
                    var b = db.TextBooks.ToList();
                    var lstreports = (from tb in db.TextBooks
                              join St in db.StudentEnrollments on tb.UnitCode_Id equals St.UnitCode_Id
                              where St.StudentDetail_FileId == fileId 
                              select new Report
                              {
                                  BookPublisher = tb.Publisher,
                                  Title = tb.Title,
                                  UnitCode = tb.UnitCode.UnitCodeName,
                                  TextBook_Year=tb.TextBook_Year,
                                  Author=tb.Author,
                                  OCLC_Number=tb.Identifier,
                                  CampusName=St.Campus.Campus_Name,
                                  ActualRequiredBook= (int)(St.Total_Enrollment != 0 ? (int)(Math.Ceiling((decimal)St.Total_Enrollment / 10)) : 0) + 2,
                                  AvaibleBook =tb.AumltInventors.Where(x=>x.Campus_Id==St.Campus_Id).Count(),
                }).GroupBy(x=> new {x.BookPublisher,x.Title,x.Author,x.TextBook_Year }).ToList();
                    List<Report> lsreport = new List<Report>();
                    foreach (var item in lstreports.SelectMany(x => x.ToList()).ToList().Distinct())
                    {
                        
                        item.NeedOrder = (item.AvaibleBook - item.ActualRequiredBook) > 0 ? 0 : (item.AvaibleBook - item.ActualRequiredBook)*(-1);
                        if (item.NeedOrder != 0)
                        {
                                lsreport.Add(item);
                        }
                    }
    
                    return lsreport;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}