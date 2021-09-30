using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class OrderController : Controller
    {
        // GET: Order
        public ActionResult Index()
        {
            return View(OrderViewModel.orderViewModels());
        }
    }
}