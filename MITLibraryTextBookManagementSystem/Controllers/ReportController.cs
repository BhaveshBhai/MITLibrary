using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        [AllowAnonymous]
        public ActionResult Index()
        {
            FileUploadModel fileUploadModel = new FileUploadModel();
            fileUploadModel.Files = fileUploadModel.GetFileList();
            return View(fileUploadModel);
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult GenerateResult(FileUploadModel fileUploadModel)
        {
            Report report = new Report();
           var d= report.GetReports(fileUploadModel.FileId);
            return View(d);
        }
    }
}