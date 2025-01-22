using System;
using Common.models;
using EfcDemo.data;

namespace EfcDemo.services;

public class StudentService
{
    public void ListStudents()
    {
        // List all students in the database
        using (var context = new FourthWallAcademyContext())
        {
            var students = context.Student.ToList();
            if (students.Count == 0)
            {
                Console.WriteLine("No students found");
            }
            else
            {
                foreach (var student in students)
                {
                    Console.WriteLine($"{student.FirstName} - {student.LastName} ({student.Alias})");
                }
            }
        }
    }
    public void AddStudent()
    {
        // Add a new student to the database
        using (var context = new FourthWallAcademyContext())
        {
            var student = new Student
            {
                FirstName = "John",
                LastName = "Doe",
                Alias = "JD",
                DoB = new DateTime(1990, 1, 1)
            };

            context.Student.Add(student);
            context.SaveChanges();
        }
    }

    public void UpdateStudent()
    {
        // Update an existing student in the database
        using (var context = new FourthWallAcademyContext())
        {
            var student = context.Student.FirstOrDefault(s => s.FirstName == "John");

            if (student != null)
            {
                student.LastName = "Smith";
                context.SaveChanges();
            }
        }
    }

    public void DeleteStudent()
    {
        // Delete an existing student from the database
        using (var context = new FourthWallAcademyContext())
        {
            var student = context.Student.FirstOrDefault(s => s.FirstName == "John");

            if (student != null)
            {
                context.Student.Remove(student);
                context.SaveChanges();
            }
        }
    }

}
