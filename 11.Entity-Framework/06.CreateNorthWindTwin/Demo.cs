using System;
using CreateNorthWindTwin;

public class Demo
{
    static void Main()
    {
        using (var dbCon = new NorthwindTwinEntities())
        {
            var shipper = new Shipper()
            {
                Phone = "08954654",
                CompanyName = "gosho ood"
            };

            dbCon.Shippers.Add(shipper);
        }
    }
}