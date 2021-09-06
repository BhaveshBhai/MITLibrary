namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TextBook
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
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

        public int? Coordinator_Id { get; set; }

        public int? Semesters_Id { get; set; }

        public int? Year_Id { get; set; }

        public int? Campus_Id { get; set; }

        public int? FileUpload_Id { get; set; }

        public virtual Campus Campus { get; set; }

        public virtual Coordinator Coordinator { get; set; }

        public virtual FileUpload FileUpload { get; set; }

        public virtual Semester Semester { get; set; }

        public virtual Year Year { get; set; }
    }
}
