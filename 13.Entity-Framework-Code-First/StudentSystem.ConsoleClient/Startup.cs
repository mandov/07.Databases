namespace StudentSystem.ConsoleClient
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    using StudentSystem.Data;
    using StudentSystem.Data.Migrations;
    using StudentSystem.Models;

    public class Startup
    {
        public static void Main()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<StudentSystemDbContext, Configuration>());
            using (var dbCon = new StudentSystemDbContext())
            {
                var student = dbCon.Students
                    .Select(s => new
                    {
                        s.Name,
                        s.Gender,
                        s.City,
                        s.BirthDate,
                        s.ClassNumber,
                        s.Courses,
                        s.Homeworks
                    }).FirstOrDefault();

                Console.WriteLine("Name:{0} \nGender: {1} \nCity: {2} \nBirthDate: {3} \nClassNumber: {4}" +
                    "\nCourses: {5} \nHomeworks: {6}",
                    student.Name,
                    student.Gender,
                    student.City,
                    student.BirthDate,
                    student.ClassNumber,
                    student.Courses.First().Name,
                    student.Homeworks.First().Content);
            }
        }
    }
}