using System;
using System.Configuration;
using System.Data.SqlClient;

class RetrieveProducts
{
    static void Main()
    {
        var dbConnectionString = ConfigurationManager.ConnectionStrings["SQLDB"];
        SqlConnection dbCon = new SqlConnection(dbConnectionString.ConnectionString);
        dbCon.Open();

        using (dbCon)
        {
            SqlCommand command = new SqlCommand(
                "SELECT p.ProductName, c.CategoryName " +
                "FROM Categories c " +
                "JOIN Products p ON c.CategoryID = p.CategoryID ", dbCon);
            SqlDataReader reader = command.ExecuteReader();
            using (reader)
            {
                Console.WriteLine("{0,-30} {1}", "Product", "Category");
                while (reader.Read())
                {
                    string productName = (string)reader["ProductName"];
                    string categoryName = (string)reader["CategoryName"];
                    Console.WriteLine("{0,-30} {1}", productName, categoryName);
                }
            }
        }
    }
}