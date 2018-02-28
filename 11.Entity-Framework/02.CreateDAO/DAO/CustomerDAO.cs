namespace CreateDAO
{
    using System.Data.Entity.Migrations;
    using System.Linq;
    using NorthWindEntityModels;

    public class CustomerDAO : ICustomerDAO
    {
        public void Delete(Customer customer)
        {
            string customerId = customer.CustomerID;
            using (var dbContext = new NorthwindEntities())
            {
                var customerToDelete = dbContext.Customers
                                                .Where(id => id.CustomerID == customerId)
                                                .FirstOrDefault();
                dbContext.Customers.Remove(customerToDelete);
                dbContext.SaveChanges();
            }
        }

        public void Insert(Customer customer)
        {
            using (var dbContext = new NorthwindEntities())
            {
                dbContext.Customers.Add(customer);
                dbContext.SaveChanges();
            }
        }

        public void Modify(Customer customer)
        {
            using (var dbContext = new NorthwindEntities())
            {
                dbContext.Customers.AddOrUpdate(customer);
                dbContext.SaveChanges();
            }
        }
    }
}