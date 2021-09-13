﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class UserModel
    {
        public int User_Id { get; set; }
        [Required(ErrorMessage = "UserName is required.")]
        [RegularExpression(@"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@mit.edu.au$", ErrorMessage = "text to display to user")]
        public string UserName { get; set; }
        
        [Required(ErrorMessage = "First name is required.")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Last name is required.")]
        public string LastName { get; set; }

        public int? Role_Id { get; set; }
        [Required(ErrorMessage = "Please enter password")]
        [DataType(DataType.Password)]
        [StringLength(100, ErrorMessage = "Password \"{0}\" must have {2} character", MinimumLength = 8)]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,}$", ErrorMessage = "Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character")]
        public string Password { get; set; }

        [Display(Name = "Confirm password")]
        [Required(ErrorMessage = "Please enter confirm password")]
        [Compare("Password", ErrorMessage = "Confirm password doesn't match, Type again !")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        public void Registration(User userModel)
        {
            try
            {
                using (var db =new  MITDBContext())
                {
                    userModel.Role_Id = 3;
                    db.Users.Add(userModel);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public bool Login(User user)
        {
            try
            {
                var userdetails = CheckUserName(user.UserName);
             return   userdetails != null ? (userdetails.Password == user.Password ? true : false) : false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public User CheckUserName(string UserName)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                 return   db.Users.Where(x => x.UserName == UserName).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {

                return null;
            }
        }
        public List<User> GetUsers()
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    return db.Users.Include("Role").ToList();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}