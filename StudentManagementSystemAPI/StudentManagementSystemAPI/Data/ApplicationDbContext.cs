using Microsoft.EntityFrameworkCore;
using StudentManagementSystemAPI.Models;

namespace StudentManagementSystemAPI.Data
{
    public class ApplicationDbContext : DbContext
    {

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
            Database.EnsureDeleted();
            Database.EnsureCreated();
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Grade> Grades { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().HasData(
                new User()
                {
                    UserId = 1,
                    FirstName = "Jon",
                    LastName = "Snow",
                    Email = "jon@snow.com",
                    PasswordHash = "6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b",
                    PhotoPath = "https://avatars.githubusercontent.com/u/59293768?v=4",
                    UserType = "student",

                },
                 new User()
                 {
                     UserId = 2,
                     FirstName = "Jon",
                     LastName = "Stark",
                     Email = "jon@jon.com",
                     PasswordHash = "6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b",
                     PhotoPath = "https://avatars.githubusercontent.com/u/59293768?v=4",
                     UserType = "lecturer",

                 },
                new User()
                {
                    UserId = 3,
                    FirstName = "Can",
                    LastName = "Oztas",
                    Email = "canoztas@ankara.tr",
                    PasswordHash = "6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b",
                    PhotoPath = "https://i.natgeofe.com/n/32820ebd-4660-4b3a-b360-8ae16c328489/kublai-khan-portrait.jpg?w=1440&h=1898",
                    UserType = "student",

                },
                new User()
                {
                    UserId = 4,
                    FirstName = "Enver",
                    LastName = "Bagci",
                    Email = "enverbagci@ankara.tr",
                    PasswordHash = "d4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35",
                    PhotoPath = "https://upload.wikimedia.org/wikipedia/tr/5/5f/Ankara_Üniversitesi_logosu.png",
                    UserType = "lecturer",

                });

            modelBuilder.Entity<Grade>().HasData(
               new Grade()
               {
                   GradeId = 1,
                   LessonName = "Maths",
                   LecturerId = 2,
                   StudentId = 1,
                   Score = 78,
                   LessonDate = "monday",

               },
               new Grade()
               {
                   GradeId = 2,
                   LessonName = "Intro to CS",
                   LecturerId = 2,
                   StudentId = 1,
                   Score = 77,
                   LessonDate = "tuesday",
               },
               new Grade()
               {
                   GradeId = 3,
                   LessonName = "Flutter",
                   LecturerId = 4,
                   StudentId = 3,
                   Score = 12,
                   LessonDate = "tuesday",
               }, 
               new Grade()
               {
                   GradeId = 4,
                   LessonName = "Intro to Network",
                   LecturerId = 4,
                   StudentId = 1,
                   Score = 77,
                   LessonDate = "friday",
               },
               new Grade()
               {
                   GradeId = 5,
                   LessonName = "Intro to Network",
                   LecturerId = 4,
                   StudentId = 3,
                   Score = 31,
                   LessonDate = "friday",
               },
               new Grade()
               {
                   GradeId = 6,
                   LessonName = "Advanced Network",
                   LecturerId = 2,
                   StudentId = 3,
                   Score = 0,
                   LessonDate = "monday",
               },
               new Grade()
               {
                   GradeId = 7,
                   LessonName = "English",
                   LecturerId = 2,
                   StudentId = 3,
                   Score = 100,
                   LessonDate = "wednesday",
               },
               new Grade()
               {
                   GradeId = 8,
                   LessonName = "Research",
                   LecturerId = 4,
                   StudentId = 3,
                   Score = 95,
                   LessonDate = "thursday",
               },
               new Grade()
               {
                   GradeId = 9,
                   LessonName = "Operating System",
                   LecturerId = 4,
                   StudentId = 3,
                   Score = 100,
                   LessonDate = "wednesday",
               }




               );
        }

    }
}
