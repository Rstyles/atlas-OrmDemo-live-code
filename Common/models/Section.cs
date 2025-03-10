using System;

namespace Common.models;

public class Section
{
    public int SectionId { get; set; }
    public Course Cource { get; set; }
    public Instructor Instructor { get; set; }
    public DateOnly StartDate { get; set; }
    public DateOnly EndDate { get; set; }
    public TimeOnly StartTime { get; set; }
    public TimeOnly EndTime { get; set; }
}
