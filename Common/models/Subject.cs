using System;

namespace Common.models;

public class Subject
{
    // Primary Key
    public int SubjectId { get; set; }

    public string SubjectName { get; set; }
    public ICollection<Course> Courses { get; set; } // Navigation property
}
