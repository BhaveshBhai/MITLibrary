namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class FileUpload
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FileUpload()
        {
            AumltInventors = new HashSet<AumltInventor>();
            StudentEnrollments = new HashSet<StudentEnrollment>();
        }

        [Key]
        public int File_Upload_Id { get; set; }

        [StringLength(50)]
        public string File_Name { get; set; }

        [StringLength(50)]
        public string Location { get; set; }

        public int? User_Id { get; set; }

        public DateTime? DateTime { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AumltInventor> AumltInventors { get; set; }

        public virtual User User { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentEnrollment> StudentEnrollments { get; set; }
    }
}
