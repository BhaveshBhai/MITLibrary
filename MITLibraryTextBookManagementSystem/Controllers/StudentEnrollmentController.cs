using MITLibraryTextBookManagementSystem.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class StudentEnrollmentController : Controller
    {
        // GET: Unit
        public ActionResult Index()
        {
            TextBookViewModel textBookViewModel = new TextBookViewModel();
            return View(textBookViewModel.GetTextBooks());
        }
        public ActionResult AddBook()
        {
            BookModel bookModel = new BookModel();
            bookModel.Campus = TextBookViewModel.GetCampusList();
            bookModel.Units = BookModel.GetUnitList();
            return View("_AddBook", bookModel);
        }
        [HttpPost]
        public ActionResult AddBook(BookModel textBookViewModel)
        {
            if (ModelState.IsValid)
            { //checking model state

                textBookViewModel.Coordinator_Name = Session["UserName"].ToString();
                textBookViewModel.UserName = Session["Email"].ToString();
                BookModel.AddBook(textBookViewModel);
                return RedirectToAction("Index");
            }
            textBookViewModel.Campus = TextBookViewModel.GetCampusList();
            textBookViewModel.Units = BookModel.GetUnitList();
            return View("_AddBook", textBookViewModel);
        }
        public ActionResult ImportStudentEnrollment()
        {
            return View();
        }
        [HttpPost]
        public JsonResult getTextBookData()
        {
            TextBookViewModel textBookViewModel = new TextBookViewModel();
            var TextBookData = "";
            string jsonResult;
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
                            (textBookViewModel.ImportTextBooks, jsonResult) = textBookViewModel.TextBookFileCheck(stream);
                            if (textBookViewModel.ImportTextBooks == null)
                            {
                                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                                return Json(jsonResult);
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

                return Json("CSV file header should be :- Unit Code,Coordinator,Author,Year,Title,Publisher,Identifier,Requirement");
            }
            return Json(new { TextBookData });
        }
        public ActionResult ImportTextBook()
        {
            TextBookViewModel textBookViewModel = new TextBookViewModel();
            string jsonResult;
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
                        (textBookViewModel.ImportTextBooks, jsonResult) = textBookViewModel.TextBookFileCheck(stream);
                       textBookViewModel.AddTextBook(textBookViewModel.ImportTextBooks, 0, 0);
                    }
                }
            }
            return RedirectToAction("Index");
        }
        public ActionResult deleteBookDetails(int Id)
        {
            BookModel.RemoveBook(Id);
            return RedirectToAction("Index");
        }
    }
}