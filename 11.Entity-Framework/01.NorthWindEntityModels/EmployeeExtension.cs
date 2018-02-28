using System.Data.Linq;

namespace NorthWindEntityModels
{
    public partial class Employee
    {
        public EntitySet<Territory> GetTerritories
        {
            get
            {
                var setOfTettitories = new EntitySet<Territory>();
                setOfTettitories.AddRange(Territories);
                return setOfTettitories;
            }
        }
    }
}