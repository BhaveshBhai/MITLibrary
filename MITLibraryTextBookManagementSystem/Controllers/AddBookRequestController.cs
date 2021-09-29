using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class AddBookRequestController : Controller
    {
        // GET: AddBookRequest
        public ActionResult Index()
        {
            return View(BookModel.lstReports());
        }
        public ActionResult NewBookList()
        {
            return View(BookModel.GetNewBookPurchseOrders());
        }
        public ActionResult PurchaseRequest(int id, int? rq)
        {
            return PartialView("_AddBookRequests", BookModel.GetBook(id,rq));
        }
        [HttpPost]
        public ActionResult AddBookRequestConform(AddBookRequestModel textBook)
        {
            AddBookRequestModel.AddBookIntoTable(textBook);
            return RedirectToAction("Index");
        }
    }
}