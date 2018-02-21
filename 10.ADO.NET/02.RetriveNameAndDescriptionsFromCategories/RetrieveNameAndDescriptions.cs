using System;
using System.Configuration;
using System.Data.SqlClient;

class RetriveNameAndDescriptions
{
    static void Main(string[] args)
    {
        var dbConnectionString = ConfigurationManager.ConnectionStrings["SQLDB"];
        SqlConnection dbCon = new SqlConnection(dbConnectionString.ConnectionString);
        dbCon.Open();

        using (dbCon)
        {
            SqlCommand command = new SqlCommand("SELECT CategoryName, Description FROM Categories", dbCon);
            SqlDataReader reader = command.ExecuteReader();
            Console.WriteLine("{0,-20}  {1,5}", "CategoryName", "Description");
            using (reader)
            {
                while (reader.Read())
                {
                    string CategoryName = (string)reader["CategoryName"];
                    string Description = (string)reader["Description"];
                    Console.WriteLine("{0,-20}  {1,5}", CategoryName, Description);
                }
            }
        }
    }
}