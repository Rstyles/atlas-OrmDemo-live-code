using System;

namespace Common.models;

public class Instructor
{
    public int InstructorId { get; set; }
    public string InstructorName { get; set; }
    public DateOnly HireDate { get; set; }
    public DateOnly? TermDate { get; set; } = null;
}
