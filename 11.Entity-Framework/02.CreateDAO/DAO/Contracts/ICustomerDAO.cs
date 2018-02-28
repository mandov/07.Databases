namespace CreateDAO
{
    using NorthWindEntityModels;

    public interface ICustomerDAO
    {
        void Insert(Customer customer);

        void Delete(Customer customer);

        void Modify(Customer customer);
    }
}