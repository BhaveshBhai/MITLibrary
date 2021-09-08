using CsvHelper;
using CsvHelper.Configuration;
using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
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
                if (textBookViewModel.UnitFile != null)
                {
                    string UnitfileName = textBookViewModel.UnitFile.FileName;
                    string UnitfileExtension = Path.GetExtension(UnitfileName);
                    

                    string targetPath = Path.Combine(targetFolder, UnitfileName);

                    if (UnitfileExtension == ".csv")
                    {
                        var UnitDetails = new List<ImportUnit>();
                        CsvConfiguration csvConfiguration = new CsvConfiguration(CultureInfo.InvariantCulture)
                        {
                            HasHeaderRecord = true,
                            Delimiter = ","
                        };

                        StreamReader streamReader = new StreamReader(textBookViewModel.UnitFile.InputStream);
                        CsvReader csvReader = new CsvReader(streamReader, csvConfiguration);
                        csvReader.Context.RegisterClassMap<ImportUnitMap>();
                        UnitDetails = csvReader.GetRecords<ImportUnit>().ToList();
                        textBookViewModel.ImportUnits = UnitDetails;
                        streamReader.Close();
                        streamReader.Dispose();
                        textBookViewModel.UnitFile.SaveAs(targetPath);
                        textBookViewModel.AddUploadedFile(folderName, UnitfileName);
                    }
                }
                if (textBookViewModel.TextBoxFile!=null) {
                    string TextBookfileName = textBookViewModel.TextBoxFile.FileName;
                    string TextBookfileExtension = Path.GetExtension(TextBookfileName);

                    string targetTextBookPath = Path.Combine(targetFolder, TextBookfileName);
                    if (TextBookfileExtension == ".csv")
                    {
                        var employees = new List<ImportTextBook>();
                        using (var sreader = new StreamReader(textBookViewModel.TextBoxFile.InputStream))
                        {
                            //First line is header. If header is not passed in csv then we can neglect the below line.
                            string[] headers = sreader.ReadLine().Split(',');
                            //Loop through the records
                            while (!sreader.EndOfStream)
                            {
                                string[] rows = sreader.ReadLine().Split(',');

                                employees.Add(new ImportTextBook
                                {
                                    Unit_Code = rows[0].ToString(),
                                    Coordinator = rows[1].ToString(),
                                    Author = rows[2].ToString(),
                                    Year = rows[3].ToString(),
                                    Title = rows[4].ToString(),
                                    Publisher = rows[5].ToString(),
                                    Identifier = rows[6].ToString(),
                                    Requirement = rows[7].ToString()
                                });
                            }
                            textBookViewModel.ImportTextBooks = employees;
                        }
                    }

                    
                    textBookViewModel.TextBoxFile.SaveAs(targetTextBookPath);
                    textBookViewModel.AddUploadedFile(folderName, TextBookfileName);
                }

                return View(textBookViewModel);
            }
            catch (Exception ex)
            {
                string[] ret = ex.Message.Split('.');
                ModelState.AddModelError("", ret[0]);
                return View(textBookViewModel);
            }
        }
    }
}