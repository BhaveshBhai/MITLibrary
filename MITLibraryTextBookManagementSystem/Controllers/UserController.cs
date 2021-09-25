using MITLibraryTextBookManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace MITLibraryTextBookManagementSystem.Controllers
{
    public class UserController : Controller
    {
        public ActionResult Index()
        {
            UserModel userModel = new UserModel();
           
            return View(userModel.GetUsers());
        }
        // GET: User
        [AllowAnonymous]
        public ActionResult Registration()
        {
            UserModel userModel = new UserModel();
            userModel.RoleName = userModel.getUserRole();
            return View(userModel);
        }
        [AllowAnonymous]
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
                userModel.FirstName =user.FirstName;
                userModel.LastName = user.LastName;
                userModel.Password = user.Password;
                userModel.ConfirmPassword = user.Password;
                userModel.UserName = user.UserName;
                userModel.RoleName = userModel.getUserRole();
                ModelState.AddModelError("", "UserName already taken");
                return View(userModel);
            }
            return View("Login");
        }
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(User user)
        {
            UserModel userModel = new UserModel();
            var roleId = userModel.Login(user);
            if (roleId > 0)
            {
                this.Session["role_id"] = roleId;
                if (roleId == 1)
                {
                    return RedirectToAction("Index", "Home");
                }
                else if (roleId == 2)
                {
                    return RedirectToAction("Index", "Unit");
                }
                else
                {
                    return RedirectToAction("Index", "Unit");
                }
            }
            else
            {
                userModel.UserName = user.UserName;
                ModelState.AddModelError("", "UserName or Passowrd is wrong. Please try it again.");
                return View(userModel);
            }
        }
        [AllowAnonymous]
        public ActionResult Logout()
        {
            Session.Clear();
            return View("Login");
        }
        [AllowAnonymous]
        [HttpGet]
       
        public ActionResult UserDetail(int id)
        {
            UserModel userModel = new UserModel();
            userModel = userModel.GetUsers(id);
            userModel.RoleName = userModel.getUserRole();
            return PartialView("_User",userModel);
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult UserEdit(User userModel)
        {
            UserModel model = new UserModel();
            model.UpdateUser(userModel);
            return RedirectToAction("Index");
        }
    }

}