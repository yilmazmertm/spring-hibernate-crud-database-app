package springdemo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import springdemo.entity.Customer;

import java.util.List;

@Repository
@EnableTransactionManagement
public class CustomerDAOImpl implements CustomerDAO{

    // Inject Session Factory
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Customer> getCustomers() {
        // get current hibernate
        Session currentSession = sessionFactory.getCurrentSession();

        // create a query
        Query<Customer> theQuery = currentSession.createQuery("from Customer " +
                "order by lastName", Customer.class);

        // execute query and get result
        List<Customer> customers = theQuery.getResultList();

        // return the result
        return customers;
    }

    @Override
    @Transactional
    public void saveCustomer(Customer theCustomer) {

        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.saveOrUpdate(theCustomer);
    }

    @Override
    @Transactional
    public Customer getCustomer(int theId) {
        // get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // retrieve/read
        return currentSession.get(Customer.class, theId);
    }

    @Override
    public void deleteCustomer(int theId) {
        // get the current session
        Session currentSession = sessionFactory.getCurrentSession();

        // delete object with pk
        Query theQuery = currentSession.createQuery("delete from Customer where id =:customerId");
        theQuery.setParameter("customerId", theId);

        theQuery.executeUpdate();
    }
}
