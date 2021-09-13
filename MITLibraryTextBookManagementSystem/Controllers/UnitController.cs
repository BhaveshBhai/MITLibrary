using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class UnitController : Controller
    {
        // GET: Unit
        public ActionResult Index()
        {
            ImportUnit importUnit = new ImportUnit();
            return View(importUnit.GetUnits());
        }
    }
}