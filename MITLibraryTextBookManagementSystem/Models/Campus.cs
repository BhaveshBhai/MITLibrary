namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Campuses")]
    public partial class Campus
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Campus()
        {
            AumltInventors = new HashSet<AumltInventor>();
            StudentEnrollments = new HashSet<StudentEnrollment>();
        }

        [Key]
        public int Campus_id { get; set; }

        [StringLength(50)]
        public string Campus_Name { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AumltInventor> AumltInventors { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentEnrollment> StudentEnrollments { get; set; }
    }
}
