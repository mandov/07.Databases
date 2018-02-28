using CreateDAO;
using NorthWindEntityModels;

public class CreateDAODemo
{
    static CustomerDAO customerDAO = new CustomerDAO();

    static void Main()
    {
        var customer = new Customer();
        customer.CustomerID = "TRIPX";
        customer.CompanyName = "Nai dobrata firma";
        customer.ContactName = "Toni Storaro";
        customer.Country = "Planeta Payner";

        InsertNewCustomer(customer);
        ModifyCustomer(customer);
        DeleteCustomer(customer);
    }

    static void InsertNewCustomer(Customer customer)
    {
        customerDAO.Insert(customer);
    }

    static void DeleteCustomer(Customer customer)
    {
        customerDAO.Delete(customer);
    }

    static void ModifyCustomer(Customer customer)
    {
        customerDAO.Modify(customer);
    }
}