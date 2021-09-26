namespace MITLibraryTextBookManagementSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class StudentEnrollment
    {
        public int StudentEnrollmentId { get; set; }

        public int? UnitCode_Id { get; set; }

        public int? Capacity { get; set; }

        public int? Campus_Id { get; set; }

        public int? Total_Enrollment { get; set; }

        public bool? RunningOrNot { get; set; }

        public int? Lab_and_tut_capacity { get; set; }

        public virtual Campus Campus { get; set; }

        public virtual UnitCode UnitCode { get; set; }
    }
}
