using System;
using System.Configuration;
using System.Data.SqlClient;

class FindProductByString
{
    static void Main()
    {
        var dbConnectionString = ConfigurationManager.ConnectionStrings["SQLDB"];
        SqlConnection dbCon = new SqlConnection(dbConnectionString.ConnectionString);
        dbCon.Open();

        using (dbCon)
        {
            string productName = Console.ReadLine();
            EscapingSpecialSymbols(productName);
            SqlCommand command = new SqlCommand(
                "SELECT ProductName FROM Products WHERE ProductName LIKE @productName", dbCon);
            command.Parameters.AddWithValue("@productName", productName);
            SqlDataReader reader = command.ExecuteReader();
            using (reader)
            {
                while (reader.Read())
                {
                    string result = (string)reader["ProductName"];
                    Console.WriteLine(result);
                }
            }
        }
    }

    static string EscapingSpecialSymbols(string productName)
    {
        productName.Replace("'", "''");
        productName.Replace("%", "'%");
        productName.Replace("\\", @"'\");
        productName.Replace("_", "'_");

        return productName;
    }
}