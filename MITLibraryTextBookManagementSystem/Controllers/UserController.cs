using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Registration()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Registration(User user)
        {
            UserModel userModel = new UserModel();
            if (userModel.CheckUserName(user.UserName) == null)
            {
                userModel.Registration(user);
            }
            else
            {
                userModel.FirstName = user.FirstName;
                userModel.LastName = user.LastName;
                userModel.Password = user.Password;
                userModel.ConfirmPassword = user.Password;
                userModel.UserName = user.UserName;
                ModelState.AddModelError("", "UserName already taken");
                return View(userModel);
            }
            return View("Login");
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(User user)
        {
            UserModel userModel = new UserModel();
            if (userModel.Login(user))
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                userModel.UserName = user.UserName;
                ModelState.AddModelError("", "UserName or Passowrd is wrong. Please try it again.");
                return View(userModel);
            }
        }
    }
}