using System;
using System.Linq;
using NorthWindEntityModels;

public class FindCustomer
{
    static void Main()
    {
        FindCustomersWithOrdersIn1997();
        Console.WriteLine("-------");
        FindCustomersWithOrdersIn1997SQL();
        Console.WriteLine("-------");
        FindSalesByRegionAndPeriod("BC", new DateTime(1997, 01, 01), new DateTime(1998, 01, 01));
    }

    static void FindCustomersWithOrdersIn1997()
    {
        using (var dbContext = new NorthwindEntities())
        {
            int yearOfOrder = 1997;
            string targetCountry = "Canada";
            var customers = dbContext.Orders
                                     .Where(c => c.OrderDate.Value.Year == yearOfOrder && c.ShipCountry == targetCountry)
                                     .Select(c => new
                                     {
                                         c.CustomerID,
                                         c.OrderDate,
                                         c.ShipCountry
                                     })
                                     .ToList();

            foreach (var customer in customers)
            {
                Console.WriteLine(customer);
            }
        }
    }

    static void FindCustomersWithOrdersIn1997SQL()
    {
        using (var dbContext = new NorthwindEntities())
        {
            var customers = dbContext.Orders.SqlQuery("SELECT * FROM Orders WHERE OrderDate > '1997.01.01' AND OrderDate < '1997.12.31' AND ShipCountry = 'Canada'");
            foreach (var customer in customers)
            {
                Console.WriteLine("CustomerID:{0} OrderDate:{1} ShipCountry:{2}", customer.CustomerID, customer.OrderDate, customer.ShipCountry);
            }
        }
    }

    static void FindSalesByRegionAndPeriod(string region,  DateTime startDate, DateTime endDate)
    {
        using (var dbContext = new NorthwindEntities())
        {
            var sales = dbContext.Orders
                                 .Where(s => s.ShipRegion == region && s.OrderDate > startDate && endDate > s.OrderDate)
                                 .Select(s => new
                                 {
                                     s.CustomerID,
                                     s.OrderDate,
                                     s.ShipRegion
                                 })
                                 .ToList();

            foreach (var sale in sales)
            {
                Console.WriteLine(sale);
            }
        }
    }
}