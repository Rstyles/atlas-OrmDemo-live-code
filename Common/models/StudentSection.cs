using System;

namespace Common.models;

public class StudentSection
{
    public int SectionId { get; set; }
    public Student Student { get; set; }
    public int Grade { get; set; }
    public int Absences { get; set; }
}
