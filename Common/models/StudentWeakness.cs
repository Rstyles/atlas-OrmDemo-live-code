using System;

namespace Common.models;

public class StudentWeakness
{
    public Student Student { get; set; }
    public Weakness Weakness { get; set; }
    public int RiskLevel { get; set; }
}
