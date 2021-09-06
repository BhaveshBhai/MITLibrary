using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
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
            string folderName = "UploadFile";
            string fileName = textBookViewModel.File.FileName;
            string fileExtension = Path.GetExtension(fileName);
            string targetFolder = Server.MapPath("~/"+ folderName);
            
            string targetPath = Path.Combine(targetFolder, fileName);
            if (fileExtension == ".csv")
            {
                var employees = new List<ImportTextBook>();
                using (var sreader = new StreamReader(textBookViewModel.File.InputStream))
                {
                    //First line is header. If header is not passed in csv then we can neglect the below line.
                    string[] headers = sreader.ReadLine().Split(',');
                    //Loop through the records
                    while (!sreader.EndOfStream)
                    {
                        string[] rows = sreader.ReadLine().Split(',');

                        employees.Add(new ImportTextBook
                        {
                            UnitCode = rows[0].ToString(),
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
            textBookViewModel.File.SaveAs(targetPath);
            textBookViewModel.AddUploadedFile(folderName, fileName);
            textBookViewModel.Year = textBookViewModel.GetYearsList();
            textBookViewModel.Campus = textBookViewModel.GetCampusList();
            textBookViewModel.Semester = textBookViewModel.GetSemesterList();
            return View(textBookViewModel);
        }
    }
}