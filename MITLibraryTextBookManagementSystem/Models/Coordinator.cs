namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Coordinator
    {
        [Key]
        public int Coordinator_Id { get; set; }

        [StringLength(50)]
        public string Coordinator_Name { get; set; }

        public int? Unit_Id { get; set; }

        public virtual Unit Unit { get; set; }
    }
}
