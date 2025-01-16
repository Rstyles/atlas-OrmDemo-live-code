using System;
using System.Security.Cryptography.X509Certificates;

namespace Common.models;

public class Course
{
    public int CourseId { get; set; }
    public Subject Subject { get; set; }
    public string CourseName { get; set; }
    public string CourseDescription { get; set; }
    public int CourseDuration { get; set; }
    public decimal Credits { get; set; }
}
