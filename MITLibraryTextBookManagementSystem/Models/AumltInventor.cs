namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class AumltInventor
    {
        [Key]
        public int AUMLTInventor_Id { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? OCLC_Number { get; set; }

        public string Item_Barcode { get; set; }

        public int? TextBookId { get; set; }

        public int? Unit_Id { get; set; }

        public int? Campus_Id { get; set; }

        public int? Inventor_FileUpload_Id { get; set; }

        public virtual Campus Campus { get; set; }

        public virtual FileUpload FileUpload { get; set; }

        public virtual TextBook TextBook { get; set; }

        public virtual Unit Unit { get; set; }
    }
}
