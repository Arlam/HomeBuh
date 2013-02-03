package homebuh.dao.impl;

import homebuh.dao.PaymentDAO;
import homebuh.entities.Payment;

import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl extends HibernateGenericDAO<Payment> implements
		PaymentDAO {

	public PaymentDAOImpl() {
		super(Payment.class);
	}

}
