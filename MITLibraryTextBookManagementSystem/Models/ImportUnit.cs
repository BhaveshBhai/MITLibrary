﻿using CsvHelper.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class ImportUnit
    {
        public string SNo { get; set; }
        public string Unitcode { get; set; }
        public string Unit_title { get; set; }
        public string Capacity { get; set; }
        public string Total_Enrolled { get; set; }
        public string Lab_and_tut_capacity { get; set; }
        public string Not_Running {get;set;}

        public List<TextBook> GetUnits()
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    return db.TextBooks.Include("Unit").ToList();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public int ReturnUnitId(string Unit_Code)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    return db.Units.Where(x=>x.Unit_Code==Unit_Code).Select(x=>x.Unit_Id).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
    }
    public sealed class ImportUnitMap : ClassMap<ImportUnit>
    {
        public ImportUnitMap()
        {
            Map(m => m.SNo).Name("SNo");
            Map(m => m.Unitcode).Name("Unitcode");
            Map(m => m.Unit_title).Name("Unit title");
            Map(m => m.Capacity).Name("Capacity");
            Map(m => m.Total_Enrolled).Name("Total enrolled");
            Map(m => m.Lab_and_tut_capacity).Name("Lab and tut. capacity");
            Map(m => m.Not_Running).Name("Not Running");
        }
    }

}