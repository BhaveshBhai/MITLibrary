namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Unit
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Unit()
        {
            AumltInventors = new HashSet<AumltInventor>();
            Coordinators = new HashSet<Coordinator>();
            TextBooks = new HashSet<TextBook>();
        }

        [Key]
        public int Unit_Id { get; set; }

        [StringLength(50)]
        public string Unit_Code { get; set; }

        [StringLength(250)]
        public string Unit_Title { get; set; }

        public int? Capacity { get; set; }

        public int? Campus_Id { get; set; }

        public int? Total_Enrollment { get; set; }

        public bool? RunningOrNot { get; set; }

        public int? Lab_and_tut_capacity { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AumltInventor> AumltInventors { get; set; }

        public virtual Campus Campus { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Coordinator> Coordinators { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TextBook> TextBooks { get; set; }
    }
}
