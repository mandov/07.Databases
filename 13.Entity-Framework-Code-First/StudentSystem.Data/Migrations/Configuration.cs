namespace StudentSystem.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    using StudentSystem.Data;
    using StudentSystem.Models;

    public sealed class Configuration : DbMigrationsConfiguration<StudentSystem.Data.StudentSystemDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
            this.ContextKey = "StudentSystem.Data.StudentSystemDbContext";
        }

        protected override void Seed(StudentSystemDbContext context)
        {
            var student = new Student
            {
                Name = "Dragan",
                ClassNumber = "65546",
                City = "Kaspichan",
                BirthDate = new DateTime(1996, 1, 1),
                Gender = Gender.Male
            };

            var homework = new Homework
            {
                Content = "Some content",
                TimeSendInMinutes = 240
            };

            var course = new Course
            {
                Name = "Programming",
                Hours = 100,
                Materials = "Some materials about programming course"
            };

            student.Courses.Add(course);
            student.Homeworks.Add(homework);
            course.Students.Add(student);
            course.Homeworks.Add(homework);

            context.Students.AddOrUpdate(s => s.Name, student);
        }
    }
}