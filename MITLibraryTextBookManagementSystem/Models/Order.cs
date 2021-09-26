namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        public int OrderId { get; set; }

        public int? TextBook_Id { get; set; }

        public int? Unit_Id { get; set; }

        public bool? IsNew { get; set; }

        public DateTime? OrderDate { get; set; }

        public DateTime? UpdateDate { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        public bool? OrderComplated { get; set; }

        public int? FileId { get; set; }

        public virtual TextBook TextBook { get; set; }

        public virtual UnitCode UnitCode { get; set; }
    }
}
