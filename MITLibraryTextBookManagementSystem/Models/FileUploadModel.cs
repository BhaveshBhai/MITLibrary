using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class FileUploadModel
    {
        public int FileId { get; set; }
        public IEnumerable<SelectListItem> Files { get; set; }


        public IEnumerable<SelectListItem> GetFileList()
        {
            SelectList lstobj = null;
            try
            {

                using (MITDBContext db = new MITDBContext())
                {
                    List<SelectListItem> list = new List<SelectListItem>();
                    var files = db.FileUploads.Select(x => new SelectListItem
                    {
                        Value = x.File_Upload_Id.ToString(),
                        Text = x.File_Name
                    }).OrderByDescending(x=>x.Value).FirstOrDefault();
                    list.Add(files);
                    lstobj = new SelectList(list, "Value", "Text");
                }
                return lstobj;
            }
            catch (Exception ex)
            {
                return lstobj;
            }
        }
    }
}