namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Semester
    {
        [Key]
        public int Semester_Id { get; set; }

        [StringLength(50)]
        public string Semester_Name { get; set; }
    }
}
