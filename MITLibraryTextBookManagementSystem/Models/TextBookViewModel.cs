using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class TextBookViewModel
    {
        public int yearId { get; set; }
        public int semesterId { get; set; }
        public int campusId { get; set; }
        public IEnumerable<SelectListItem> Year { get; set; }
        public IEnumerable<SelectListItem> Semester { get; set; }
        public IEnumerable<SelectListItem> Campus { get; set; }
        public HttpPostedFileBase TextBoxFile { get; set; }
        public HttpPostedFileBase UnitFile { get; set; }
        public IList<ImportTextBook> ImportTextBooks { get; set; }
        public IList<ImportUnit> ImportUnits { get; set; }

        public IEnumerable<SelectListItem> GetYearsList()
        {
            SelectList lstobj = null;
            try
            {
                using (MITDBContext db = new MITDBContext())
                {
                    var list = db.Years.Select(x => new SelectListItem
                    {
                        Value = x.Year_Id.ToString(),
                        Text = x.Year_Name
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
        public IEnumerable<SelectListItem> GetSemesterList()
        {
            SelectList lstobj = null;
            try
            {
                using (MITDBContext db = new MITDBContext())
                {
                    var list = db.Semesters.Select(x => new SelectListItem
                    {
                        Value = x.Semester_Id.ToString(),
                        Text = x.Semester_Name
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
        public IEnumerable<SelectListItem> GetCampusList()
        {
            SelectList lstobj = null;
            try
            {
                using (MITDBContext db = new MITDBContext())
                {
                    var list = db.Campuses.Select(x => new SelectListItem
                    {
                        Value = x.Campus_id.ToString(),
                        Text = x.Campus_Name
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
        public void AddUploadedFile(string location, string fileName)
        {
            try
            {

                using (MITDBContext db = new MITDBContext())
                {
                    var fileUpload = new FileUpload()
                    {
                        File_Name = fileName,
                        Location = location,
                        User_Id = 1
                    };
                    db.Entry(fileUpload).State= System.Data.Entity.EntityState.Added;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}