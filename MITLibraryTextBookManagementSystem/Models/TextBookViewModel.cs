using CsvHelper;
using CsvHelper.Configuration;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
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
        public string ImportUnit { get; set; }
        public string JsonImportTextBook { get; set; }
        public int FileUploadId { get; set; }
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
        public int AddUploadedFile(string location, string fileName)
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
                    return fileUpload.File_Upload_Id;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public List<ImportUnit> UnitFileCheck(Stream stream)
        {
            try
            {
                var UnitDetails = new List<ImportUnit>();
                CsvConfiguration csvConfiguration = new CsvConfiguration(CultureInfo.InvariantCulture)
                {
                    HasHeaderRecord = true,
                    Delimiter = ","
                };

                StreamReader streamReader = new StreamReader(stream);
                CsvReader csvReader = new CsvReader(streamReader, csvConfiguration);
                csvReader.Context.RegisterClassMap<ImportUnitMap>();
                UnitDetails = csvReader.GetRecords<ImportUnit>().ToList();

                streamReader.Close();
                streamReader.Dispose();
                return UnitDetails;

            }
            catch (Exception ex)
            {
                return null;
            }
            
        }
        public List<ImportTextBook> TextBookFileCheck(Stream stream)
        {
            try
            {
                var UnitDetails = new List<ImportTextBook>();
                CsvConfiguration csvConfiguration = new CsvConfiguration(CultureInfo.InvariantCulture)
                {
                    HasHeaderRecord = true,
                    Delimiter = ","
                };

                StreamReader streamReader = new StreamReader(stream);
                CsvReader csvReader = new CsvReader(streamReader, csvConfiguration);
                csvReader.Context.RegisterClassMap<ImportTextBookMap>();
                UnitDetails = csvReader.GetRecords<ImportTextBook>().ToList();

                streamReader.Close();
                streamReader.Dispose();
                return UnitDetails;

            }
            catch (Exception ex)
            {
                return null;
            }

        }
        public void AddUnit(IList<ImportUnit> importUnits, int campusId)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    foreach (var item in importUnits)
                    {
                        var unit = db.Units.Where(x => x.Unit_Code == item.Unitcode).FirstOrDefault();
                        if (unit == null)
                        {
                            unit = new Unit();
                            unit.Campus_Id = campusId;
                            unit.Capacity =string.IsNullOrEmpty(item.Capacity)?0: Convert.ToInt32( item.Capacity);
                            unit.Lab_and_tut_capacity = string.IsNullOrEmpty(item.Lab_and_tut_capacity) ? 0 : Convert.ToInt32(item.Lab_and_tut_capacity);
                            unit.RunningOrNot = Convert.ToBoolean(item.Not_Running);
                            unit.Total_Enrollment = string.IsNullOrEmpty(item.Total_Enrolled) ? 0 : Convert.ToInt32(item.Total_Enrolled);
                            unit.Unit_Code = item.Unitcode;
                            unit.Unit_Title = item.Unit_title;
                            db.Units.Add(unit);
                            db.SaveChanges();
                        }
                        
                    }
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public void AddTextBook(IList<ImportTextBook> importTextBooks, int campusId, int semsterId, int YearId, int FileId)
        {
            try
            {
                ImportUnit importUnit = new ImportUnit();
                using (var db = new MITDBContext())
                {
                    foreach (var item in importTextBooks)
                    {
                        var UnitId = importUnit.ReturnUnitId(item.Unit_Code);
                        //var textBook = db.TextBooks.Where(x => x.FileUpload_Id == FileId).FirstOrDefault();
                        if (UnitId>1)
                        {
                            TextBook textBook = new TextBook();
                            textBook.Campus_Id = campusId;
                            textBook.Year_Id = yearId;
                            textBook.Semesters_Id = semsterId;
                            textBook.Author = item.Author;
                            textBook.Coordinator_Name = item.Coordinator;
                            textBook.FileUpload_Id = FileUploadId;
                            textBook.Identifier = item.Identifier;
                            textBook.Publisher = item.Publisher;
                            textBook.Requirement = item.Requirement;
                            textBook.TextBook_Year =Convert.ToInt32(item.Year);
                            textBook.Unit_Id = UnitId;
                            db.TextBooks.Add(textBook);
                            db.SaveChanges();
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}