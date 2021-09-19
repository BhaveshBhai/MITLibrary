namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TextBook
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TextBook()
        {
            AumltInventors = new HashSet<AumltInventor>();
        }

        [Key]
        public int TextBook_Id { get; set; }

        public int? TextBook_Year { get; set; }

        [StringLength(250)]
        public string Author { get; set; }

        [StringLength(250)]
        public string Title { get; set; }

        [StringLength(250)]
        public string Publisher { get; set; }

        [StringLength(150)]
        public string Identifier { get; set; }

        [StringLength(250)]
        public string Requirement { get; set; }

        public int? Semesters_Id { get; set; }

        public int? Year_Id { get; set; }

        public int? Campus_Id { get; set; }

        public int? FileUpload_Id { get; set; }

        public string Coordinator_Name { get; set; }

        public int? Unit_Id { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AumltInventor> AumltInventors { get; set; }

        public virtual Campus Campus { get; set; }

        public virtual FileUpload FileUpload { get; set; }

        public virtual Semester Semester { get; set; }

        public virtual Unit Unit { get; set; }

        public virtual Year Year { get; set; }
    }
}
