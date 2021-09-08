using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class ImportTextBook
    {
        public string Unit_Code { get; set; }
        public string Coordinator { get; set; }
        public string Author { get; set; }
        public string Year { get; set; }
        public string Title { get; set; }
        public string Publisher { get; set; }
        public string Identifier { get; set; }
        public string Requirement { get; set; }

    }
}