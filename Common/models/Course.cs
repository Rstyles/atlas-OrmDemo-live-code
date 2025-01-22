using System;
using System.Security.Cryptography.X509Certificates;

namespace Common.models;

public class Course
{
    public int CourseId { get; set; } // Primary Key
    public int SubjectId { get; set; } // Foreign Key
    public string CourseName { get; set; }
    public string CourseDescription { get; set; }
    public decimal Credits { get; set; }
    public virtual Subject Subject { get; set; } // Navigation property
}
