using System.IO;
using System.Configuration;
using System.Data.SqlClient;

class RetrieveImage
{
    static void Main()
    {
        var dbConnectionString = ConfigurationManager.ConnectionStrings["SQLDB"];
        SqlConnection dbCon = new SqlConnection(dbConnectionString.ConnectionString);
        dbCon.Open();

        using (dbCon)
        {
            SqlCommand command = new SqlCommand("SELECT CategoryName, Picture FROM Categories", dbCon);
            SqlDataReader reader = command.ExecuteReader();
            using (reader)
            {

                while (reader.Read())
                {
                    byte[] image = (byte[])reader["Picture"];
                    string categoryName = (string)reader["CategoryName"];
                    SaveImage(categoryName, image);
                }
            }
        }
    }

    static void SaveImage(string fileName, byte[] content)
    {
        FileStream stream = File.OpenWrite(@"..\..\" + fileName + ".jpg");
        using (stream)
        {
            stream.Write(content, 0, content.Length);
        }
    }
}