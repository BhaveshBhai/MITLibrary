using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class PurchaseOrderController : Controller
    {
        // GET: PurchaseOrder
        public ActionResult Index()
        {
            return View(BookModel.GetPurchaseOrders());
        }
        public ActionResult NewBookList()
        {
            return View(BookModel.GetNewBookPurchseOrders());
        }
        public ActionResult PurchaseRequest(int id, int? rq)
        {
            return PartialView("_PurchaseOrders", BookModel.GetBook(id,rq));
        }
        [HttpPost]
        public ActionResult PurchaseOrderConform(PurchaseOrderModel textBook)
        {
            PurchaseOrderModel.AddBookIntoTable(textBook);
            return RedirectToAction("Index");
        }
    }
}