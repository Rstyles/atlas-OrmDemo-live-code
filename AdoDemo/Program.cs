using MySql.Data.MySqlClient;

namespace AdoDemo;

class Program
{
    static void Main(string[] args)
    {
        string connectionString = "server=127.0.0.1;uid=root;database=FourthWallAcademy";

        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            connection.Open();
            
            string query = "SELECT * FROM Student";
            MySqlCommand command = new MySqlCommand(query, connection);

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Console.WriteLine(reader["FirstName"]);
                }
            }
        }
    }
}
