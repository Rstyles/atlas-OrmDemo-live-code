using EfcDemo.data;
using EfcDemo.services;
using Microsoft.EntityFrameworkCore;

namespace EfcDemo;

class Program
{
    static void Main(string[] args)
    {
        var studentService = new StudentService();

        // studentService.AddStudent();
        // studentService.UpdateStudent();
        // studentService.DeleteStudent();
        studentService.ListStudents();

    }
        public void ListCourses()
        {
            using (var context = new FourthWallAcademyContext())
        {
            var courses = context.Course
                .Include(c => c.Subject)
                .ToList();
            if (courses.Count == 0)
            {
                Console.WriteLine("No students found");
            }
            else
            {
                foreach (var course in courses)
                {
                    Console.WriteLine(course.CourseName);
                    if (course.Subject == null)
                    {
                        Console.WriteLine("No subject found");
                        continue;
                    }
                    Console.WriteLine($"{course.Subject.SubjectName}");
                }
            }
        }
        }
}
