using CsvHelper.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MITLibraryTextBookManagementSystem.Models
{
    public class ImportInventor
    {
        //public string Institution_Symbol { get; set; }
        public string Item_Holding_Location { get; set; }
        //public string Material_Format { get; set; }
        public string OCLC_Number { get; set; }
        //public string Publication_Date { get; set; }
        public string Item_Barcode { get; set; }
        public string Item_Status_Current_Status { get; set; }

        public TextBook ReturnUnitId(string IdentityNumber)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    return db.TextBooks.Where(x => x.Identifier == IdentityNumber).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public int ReturnCampusId(string CampusName)
        {
            try
            {
                using (var db = new MITDBContext())
                {
                    return db.Campuses.Where(X => X.Campus_Name == CampusName).Select(x => x.Campus_id).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
    public sealed class ImportInventorMap : ClassMap<ImportInventor>
    {
        public ImportInventorMap()
        {
            //Map(m => m.Institution_Symbol).Name("Institution_Symbol");
            Map(m => m.Item_Holding_Location).Name("Item_Holding_Location");
            //Map(m => m.Material_Format).Name("Material_Format");
            Map(m => m.OCLC_Number).Name("OCLC_Number");
            //Map(m => m.Publication_Date).Name("Publication_Date");
            Map(m => m.Item_Barcode).Name("Item_Barcode");
            Map(m => m.Item_Status_Current_Status).Name("Item_Status_Current_Status");
        }
    }
}