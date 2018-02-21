using System.Configuration;
using System.Data.SqlClient;

class AddNewProducts
{
    static void Main()
    {
        var dbConnectionString = ConfigurationManager.ConnectionStrings["SQLDB"];
        SqlConnection dbCon = new SqlConnection(dbConnectionString.ConnectionString);
        dbCon.Open();
        AddNewProduct(dbCon, "Apple", 7, 7, "10 boxes x 20 units", 1, false);
        dbCon.Close();
    }

    static void AddNewProduct(SqlConnection dbCon, string name, int supplierID, int categoryID, string quantityPerUnit, decimal unitPrice, bool discontinued)
    {
        SqlCommand command = new SqlCommand("" +
             "INSERT INTO Products(ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, Discontinued)" +
             "VALUES (@name, @supplierID, @categoryID, @quantityPerUnit, @unitPrice, @discontinued)", dbCon);
        command.Parameters.AddWithValue("@name", name);
        command.Parameters.AddWithValue("@supplierID", supplierID);
        command.Parameters.AddWithValue("@categoryID", categoryID);
        command.Parameters.AddWithValue("@quantityPerUnit", quantityPerUnit);
        command.Parameters.AddWithValue("@unitPrice", unitPrice);
        command.Parameters.AddWithValue("@discontinued", discontinued);
        command.ExecuteNonQuery();
    }
}