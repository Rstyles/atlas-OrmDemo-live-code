using Common.models;
using Dapper;
using MySql.Data.MySqlClient;

namespace DapperDemo;

class Program
{
    static void Main(string[] args)
    {
        string connectionString = "server=127.0.0.1;uid=root;database=FourthWallAcademy";

        using (var connection = new MySqlConnection(connectionString))
        {
            connection.Open();

            var query = "SELECT * FROM Student";
            var students = connection.Query<Student>(query);

            foreach (var student in students)
            {
                Console.WriteLine($"{student.StudentId}: {student.FirstName} {student.LastName} - {student.Alias}");
            }
        }
    }
}
