using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class OrderViewModel
    {
        public string UserName { get; set; }
        public string BookTitle{ get; set; }
        public string BookPublisher { get; set; }
        public string Author { get; set; }
        public string DateTime { get; set; }
        
        public static List<OrderViewModel> orderViewModels()
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    var fileid = db.FileUploads.ToList().OrderByDescending(x => x.File_Upload_Id).FirstOrDefault();
                    var lst = (from od in db.Orders
                               join bk in db.TextBooks on od.TextBook_Id equals bk.TextBook_Id
                               where od.FileId == fileid.File_Upload_Id
                               select new OrderViewModel
                               {
                                   Author = bk.Author,
                                   BookPublisher = bk.Publisher,
                                   BookTitle = bk.Title,
                                   DateTime = od.OrderDate.ToString(),
                                   UserName = od.UserName
                               }).ToList();
                    return lst;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

    }
}