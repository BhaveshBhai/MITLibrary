using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace MITLibraryTextBookManagementSystem.Models
{
    public partial class MITDBContext : DbContext
    {
        public MITDBContext()
            : base("name=MITDBContext")
        {
        }

        public virtual DbSet<Campus> Campuses { get; set; }
        public virtual DbSet<Coordinator> Coordinators { get; set; }
        public virtual DbSet<FileUpload> FileUploads { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Semester> Semesters { get; set; }
        public virtual DbSet<TextBook> TextBooks { get; set; }
        public virtual DbSet<Unit> Units { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Year> Years { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FileUpload>()
                .HasMany(e => e.TextBooks)
                .WithOptional(e => e.FileUpload)
                .HasForeignKey(e => e.FileUpload_Id);

            modelBuilder.Entity<Semester>()
                .HasMany(e => e.TextBooks)
                .WithOptional(e => e.Semester)
                .HasForeignKey(e => e.Semesters_Id);
        }
    }
}