using CsvHelper;
using CsvHelper.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
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
        public HttpPostedFileBase InventorFile { get; set; }
        public string ImportInventor { get; set; }
        public IList<ImportTextBook> ImportTextBooks { get; set; }
        public IList<ImportUnit> ImportUnits { get; set; }
        public IList<ImportInventor> ImportInventors { get; set; }
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
                    db.Entry(fileUpload).State = System.Data.Entity.EntityState.Added;
                    db.SaveChanges();
                    return fileUpload.File_Upload_Id;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public (List<ImportUnit>, string) UnitFileCheck(Stream stream)
        {
            string jsonResult = string.Empty;
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
                foreach (var item in UnitDetails)
                {
                    Regex regexForUnit = new Regex(@"^[A-Za-z]{2}[0-9]{3}\z");
                    Regex regeNumber = new Regex(@"^[0-9]");

                    if (!regexForUnit.Match(item.Unitcode).Success)
                    {
                        jsonResult = "Unit Code should be first two charcter and 3 number allow only instead of " + item.Unitcode;
                        return (null, jsonResult);
                    }
                    else if (!regeNumber.Match(item.Capacity).Success)
                    {
                        jsonResult = "Capacity only allow number instead of" + item.Capacity;
                        return (null, jsonResult);
                    }
                    else if (!regeNumber.Match(item.Lab_and_tut_capacity).Success)
                    {
                        jsonResult = "Lab_and_tut_capacity only allow number instead of" + item.Lab_and_tut_capacity;
                        return (null, jsonResult);
                    }
                    else if (!regeNumber.Match(item.Total_Enrolled).Success)
                    {
                        jsonResult = "Total_Enrolled only allow number instead of" + item.Total_Enrolled;
                        return (null, jsonResult);
                    }
                }

                return (UnitDetails, jsonResult);

            }
            catch (Exception ex)
            {
                return (null, "CSV file header should be :- Unitcode,Unit title,Capacity,Total enrolled,Lab and tut. capacity,Not Running");
            }

        }
        public (List<ImportTextBook>, string) TextBookFileCheck(Stream stream)
        {
            string jsonResult = string.Empty;
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
                foreach (var item in UnitDetails)
                {
                    Regex regexForUnit = new Regex(@"^[A-Za-z]{2}[0-9]{3}\z");
                    Regex regeNumber = new Regex(@"^[0-9]");

                    if (!regexForUnit.Match(item.Unit_Code).Success)
                    {
                        jsonResult = "Unit Code should be first two charcter and 3 number allow only instead of " + item.Unit_Code;
                        return (null, jsonResult);
                    }
                    else if (!regeNumber.Match(item.Year).Success)
                    {
                        jsonResult = "Year only allow number instead of" + item.Year;
                        return (null, jsonResult);
                    }
                    else if (!regeNumber.Match(item.Identifier).Success)
                    {
                        jsonResult = "Identifier only allow number instead of" + item.Identifier;
                        return (null, jsonResult);
                    }
                }
                return (UnitDetails, jsonResult);

            }
            catch (Exception ex)
            {
                return (null, "CSV file header should be :- Unit Code,Coordinator,Author,Year,Title,Publisher,Identifier,Requirement");
            }

        }
        public (List<ImportInventor>, string) InventorFileCheck(Stream stream)
        {
            string jsonResult = string.Empty;
            try
            {
                var UnitDetails = new List<ImportInventor>();
                CsvConfiguration csvConfiguration = new CsvConfiguration(CultureInfo.InvariantCulture)
                {
                    HasHeaderRecord = true,
                    Delimiter = ","
                };

                StreamReader streamReader = new StreamReader(stream);
                CsvReader csvReader = new CsvReader(streamReader, csvConfiguration);
                csvReader.Context.RegisterClassMap<ImportInventorMap>();
                UnitDetails = csvReader.GetRecords<ImportInventor>().ToList();
                streamReader.Close();
                streamReader.Dispose();
                foreach (var item in UnitDetails)
                {
                    Regex regexForUnit = new Regex(@"^[A-Za-z]{2}[0-9]{3}\z");
                    Regex regeNumber = new Regex(@"^[0-9]");
if (!regeNumber.Match(item.OCLC_Number).Success)
                    {
                        jsonResult = "OCLC_Number only allow number instead of" + item.OCLC_Number;
                        return (null, jsonResult);
                    }
                }

                return (UnitDetails, jsonResult);

            }
            catch (Exception ex)
            {
                return (null, "CSV file header should be :- Institution_Symbol,Item_Holding_Location,Material_Format,OCLC_Number,Publication_Date,Item_Barcode,Item_Status_Current_Status");
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
                            unit.Capacity = string.IsNullOrEmpty(item.Capacity) ? 0 : Convert.ToInt32(item.Capacity);
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
                        if (UnitId > 1)
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
                            textBook.TextBook_Year = Convert.ToInt32(item.Year);
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
        public void AddInventor(IList<ImportInventor> importInventors, int campusId,int FileId)
        {
            try
            {
                ImportInventor importInventor = new ImportInventor();
                using (var db = new MITDBContext())
                {
                    foreach (var item in importInventors)
                    {
                        var inventor = importInventor.ReturnUnitId(item.OCLC_Number);
                        campusId = importInventor.ReturnCampusId(item.Item_Holding_Location); 
                        if (inventor != null)
                        {
                            AumltInventor inventors = new AumltInventor();
                            inventors.Campus_Id = campusId;
                            inventors.OCLC_Number = Convert.ToDecimal(item.OCLC_Number);
                            inventors.TextBookId = inventor.TextBook_Id;
                            inventors.Unit_Id = inventor.Unit_Id;
                            inventors.Item_Barcode = item.Item_Barcode;
                            inventors.Inventor_FileUpload_Id = FileId;
                            db.AumltInventors.Add(inventors);
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