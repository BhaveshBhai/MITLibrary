using CsvHelper;
using CsvHelper.Configuration;
using MITLibraryTextBookManagementSystem.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class FileUploadController : Controller
    {
        // GET: FileUpload
        public ActionResult Index()
        {
            TextBookViewModel textBookViewModel = new TextBookViewModel();
            textBookViewModel.Year = textBookViewModel.GetYearsList();
            textBookViewModel.Campus = textBookViewModel.GetCampusList();
            textBookViewModel.Semester = textBookViewModel.GetSemesterList();
            return View(textBookViewModel);
        }
        [HttpPost]
        public ActionResult Index(TextBookViewModel textBookViewModel)
        {
            try
            {
                textBookViewModel.Year = textBookViewModel.GetYearsList();
                textBookViewModel.Campus = textBookViewModel.GetCampusList();
                textBookViewModel.Semester = textBookViewModel.GetSemesterList();
                string folderName = "UploadFile";
                string targetFolder = Server.MapPath("~/" + folderName);
                if (textBookViewModel.UnitFile != null && textBookViewModel.ImportUnit==null)
                {
                    string UnitfileName = textBookViewModel.UnitFile.FileName;
                    string UnitfileExtension = Path.GetExtension(UnitfileName);


                    string targetPath = Path.Combine(targetFolder, UnitfileName);

                    if (UnitfileExtension == ".csv")
                    {
                        var stream = textBookViewModel.UnitFile.InputStream;
                        textBookViewModel.ImportUnits= textBookViewModel.UnitFileCheck(stream);
                        if (textBookViewModel.ImportUnits == null)
                        {
                            ModelState.AddModelError("", "CSV file header should be :- Unitcode,Unit title,Capacity,Total enrolled,Lab and tut. capacity,Not Running");
                            return View(textBookViewModel);
                        }
                    }
                    
                }
                else if(textBookViewModel.ImportUnit!=null)
                {
                    textBookViewModel.ImportUnits = JsonConvert.DeserializeObject<List<ImportUnit>>(textBookViewModel.ImportUnit);
                }
                else
                {
                    ModelState.AddModelError("", "Please select Unit file");
                    return View(textBookViewModel);
                }
                if (textBookViewModel.TextBoxFile != null)
                {
                    string TextBookfileName = textBookViewModel.TextBoxFile.FileName;
                    string TextBookfileExtension = Path.GetExtension(TextBookfileName);

                    string targetTextBookPath = Path.Combine(targetFolder, TextBookfileName);
                    if (TextBookfileExtension == ".csv" && textBookViewModel.JsonImportTextBook == null)
                    {
                        var stream = textBookViewModel.TextBoxFile.InputStream;
                        textBookViewModel.ImportTextBooks = textBookViewModel.TextBookFileCheck(stream);
                        if (textBookViewModel.ImportTextBooks == null)
                        {
                            ModelState.AddModelError("", "CSV file header should be :- Unit Code,Coordinator,Author,Year,Title,Publisher,Identifier,Requirement");
                            return View(textBookViewModel);
                            
                        }
                        textBookViewModel.TextBoxFile.SaveAs(targetTextBookPath);
                        textBookViewModel.FileUploadId = textBookViewModel.AddUploadedFile(folderName, TextBookfileName);
                    }
                    else if (textBookViewModel.ImportUnit != null)
                    {
                        textBookViewModel.ImportTextBooks = JsonConvert.DeserializeObject<List<ImportTextBook>>(textBookViewModel.JsonImportTextBook);
                        textBookViewModel.TextBoxFile.SaveAs(targetTextBookPath);
                        textBookViewModel.FileUploadId = textBookViewModel.AddUploadedFile(folderName, TextBookfileName);
                    }
                    else
                    {
                        ModelState.AddModelError("", "Please select TextBook file");
                        return View(textBookViewModel);
                    }
                    
                }
                else
                {
                    ModelState.AddModelError("", "Please select TextBook file");
                    return View(textBookViewModel);
                }

                textBookViewModel.AddUnit(textBookViewModel.ImportUnits, textBookViewModel.campusId);
                textBookViewModel.AddTextBook(textBookViewModel.ImportTextBooks, textBookViewModel.campusId, textBookViewModel.semesterId, textBookViewModel.yearId, textBookViewModel.FileUploadId);
                textBookViewModel.ImportUnits = null;
                textBookViewModel.ImportUnit = null;
                textBookViewModel.ImportTextBooks = null;
                textBookViewModel.JsonImportTextBook = null;
                return View(textBookViewModel);
            }
            catch (Exception ex)
            {
                string[] ret = ex.Message.Split('.');
                ModelState.AddModelError("", ret[0]);
                return View(textBookViewModel);
            }
        }
        [HttpPost]
        public PartialViewResult GetUnitDetails()
        {
            TextBookViewModel textBookViewModel = new TextBookViewModel();
            try
            {
                foreach (string file in Request.Files)
                {
                    var fileContent = Request.Files[file];
                    if (fileContent != null && fileContent.ContentLength > 0)
                    {
                        // get a stream
                        var stream = fileContent.InputStream;
                        // and optionally write the file to disk
                        var fileName = Path.GetFileName(fileContent.FileName);
                        var path = Path.Combine(Server.MapPath("~/App_Data/Unit"), fileName);
                        string UnitfileExtension = Path.GetExtension(fileName);
                        if (UnitfileExtension == ".csv")
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
                            textBookViewModel.ImportUnits = UnitDetails;
                            streamReader.Close();
                            streamReader.Dispose();
                            //textBookViewModel.UnitFile.SaveAs(path);
                            //textBookViewModel.AddUploadedFile(path, fileName);
                        }
                    }
                }
                return PartialView("_Units", textBookViewModel);
            }
            catch (Exception ex)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return PartialView("_Units", textBookViewModel);
                //return Json("CSV file header should be :- Unitcode,Unit title,Capacity,Total enrolled,Lab and tut. capacity,Not Running,");
            }
            var FilereturnData = JsonConvert.SerializeObject(textBookViewModel.ImportUnits);

            //return Json(new { FilereturnData });
        }
        public ActionResult FileUploadIndex()
        {
            TextBookViewModel textBookViewModel = new TextBookViewModel();
            textBookViewModel.Year = textBookViewModel.GetYearsList();
            textBookViewModel.Campus = textBookViewModel.GetCampusList();
            textBookViewModel.Semester = textBookViewModel.GetSemesterList();
            return View(textBookViewModel);
        }

        [HttpPost]
        public JsonResult getUnitData()
        {
            TextBookViewModel textBookViewModel = new TextBookViewModel();
            var FilereturnData = "";
            try
            {
                foreach (string file in Request.Files)
                {
                    var fileContent = Request.Files[file];
                    if (fileContent != null && fileContent.ContentLength > 0)
                    {
                        // get a stream
                        var stream = fileContent.InputStream;
                        // and optionally write the file to disk
                        var fileName = Path.GetFileName(fileContent.FileName);
                        var path = Path.Combine(Server.MapPath("~/App_Data/Unit"), fileName);
                        string UnitfileExtension = Path.GetExtension(fileName);
                        if (UnitfileExtension == ".csv")
                        {
                            textBookViewModel.ImportUnits = textBookViewModel.UnitFileCheck(stream);
                           if (textBookViewModel.ImportUnits == null)
                            {
                                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                                return Json("CSV file header should be :- Unitcode,Unit title,Capacity,Total enrolled,Lab and tut. capacity,Not Running,");
                            }
                            else
                            {
                                FilereturnData = JsonConvert.SerializeObject(textBookViewModel.ImportUnits);
                                textBookViewModel.ImportUnit = FilereturnData;
                                return Json(new { FilereturnData });
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
               
                return Json("CSV file header should be :- Unitcode,Unit title,Capacity,Total enrolled,Lab and tut. capacity,Not Running");
            }
            return Json(new { FilereturnData });
        }

        [HttpPost]
        public JsonResult getTextBookData()
        {
            TextBookViewModel textBookViewModel = new TextBookViewModel();
            var TextBookData = "";
            try
            {
                foreach (string file in Request.Files)
                {
                    var fileContent = Request.Files[file];
                    if (fileContent != null && fileContent.ContentLength > 0)
                    {
                        // get a stream
                        var stream = fileContent.InputStream;
                        // and optionally write the file to disk
                        var fileName = Path.GetFileName(fileContent.FileName);
                        var path = Path.Combine(Server.MapPath("~/App_Data/TextBook"), fileName);
                        string UnitfileExtension = Path.GetExtension(fileName);
                        if (UnitfileExtension == ".csv")
                        {
                            textBookViewModel.ImportTextBooks = textBookViewModel.TextBookFileCheck(stream);
                            if (textBookViewModel.ImportTextBooks == null)
                            {
                                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                                return Json("CSV file header should be :- Unit Code,Coordinator,Author,Year,Title,Publisher,Identifier,Requirement");
                            }
                            else
                            {
                                TextBookData = JsonConvert.SerializeObject(textBookViewModel.ImportTextBooks);
                                textBookViewModel.JsonImportTextBook = TextBookData;
                                return Json(new { TextBookData });
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;

                return Json("CSV file header should be :- Unitcode,Unit title,Capacity,Total enrolled,Lab and tut. capacity,Not Running");
            }
            return Json(new { TextBookData });
        }
    }
}

