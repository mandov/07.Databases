using System;
using System.Configuration;
using System.Data.SqlClient;

class NumberOfRowsFromCategories
{
    static void Main()
    {
        var dbConnectionString = ConfigurationManager.ConnectionStrings["SQLDB"];
        SqlConnection dbCon = new SqlConnection(dbConnectionString.ConnectionString);
        dbCon.Open();

        using (dbCon)
        {
            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Categories", dbCon);
            int numberOfRowsFromCategories = (int)command.ExecuteScalar();
            Console.WriteLine("Number of Rows: {0}", numberOfRowsFromCategories);
        }
    }
}