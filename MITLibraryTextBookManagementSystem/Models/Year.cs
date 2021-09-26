namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Year
    {
        [Key]
        public int Year_Id { get; set; }

        [StringLength(50)]
        public string Year_Name { get; set; }
    }
}
