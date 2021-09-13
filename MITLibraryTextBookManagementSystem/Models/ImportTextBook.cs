using CsvHelper.Configuration;
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
    public sealed class ImportTextBookMap : ClassMap<ImportTextBook>
    {
        public ImportTextBookMap()
        {
            Map(m => m.Unit_Code).Name("Unit Code");
            Map(m => m.Coordinator).Name("Coordinator");
            Map(m => m.Author).Name("Author");
            Map(m => m.Year).Name("Year");
            Map(m => m.Title).Name("Title");
            Map(m => m.Publisher).Name("Publisher");
            Map(m => m.Identifier).Name("Identifier");
            Map(m => m.Requirement).Name("Requirement");
        }
    }
}