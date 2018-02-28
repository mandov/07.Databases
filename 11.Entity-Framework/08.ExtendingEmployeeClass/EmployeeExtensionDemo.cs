using System;
using System.Linq;
using NorthWindEntityModels;

public class EmployeeExtensionDemo
{
    static void Main()
    {
        using (var dbCon = new NorthwindEntities())
        {
            var employee = dbCon.Employees.FirstOrDefault();

            foreach (var territory in employee.GetTerritories)
            {
                Console.WriteLine(territory.TerritoryDescription);
            }
        }
    }
}