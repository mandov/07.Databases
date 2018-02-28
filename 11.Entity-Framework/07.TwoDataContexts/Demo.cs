using System;
using System.Linq;
using NorthWindEntityModels;

public class Demo
{
    static void Main()
    {
        using (var firstDbCon = new NorthwindEntities())
        {
            var customer = firstDbCon.Customers
                           .FirstOrDefault();
            Console.WriteLine("Original company name of customer from firstDbContext: {0}", customer.CompanyName);

            // Set new CompanyName with firstDbContext
            customer.CompanyName = "Star";
            Console.WriteLine("CompanyName after changing :{0}", customer.CompanyName);
            using (var secondDbCon = new NorthwindEntities())
            {
                var sameCustomer = secondDbCon.Customers
                                              .FirstOrDefault();
                Console.WriteLine("Original company name of customer from secondDbContext: {0}", sameCustomer.CompanyName);
                //Set new CompanyName with secondDbContext 
                sameCustomer.CompanyName = "BestFoods";
                Console.WriteLine("CompanyName after changing:{0}", sameCustomer.CompanyName);

                firstDbCon.SaveChanges();
                secondDbCon.SaveChanges();

            }
        }

        using (var dbCon = new NorthwindEntities())
        {
            var customer = dbCon.Customers
                                .FirstOrDefault();

            Console.WriteLine("Actual CompanyName:{0}", customer.CompanyName);
        }
    }
}
