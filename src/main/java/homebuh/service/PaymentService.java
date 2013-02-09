package homebuh.service;

import homebuh.dao.AccountDAO;
import homebuh.dao.GenericDAO;
import homebuh.dao.PaymentDAO;
import homebuh.entities.Payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PaymentService extends GenericService<Payment> {

	@Autowired
	private PaymentDAO paymentDAO;

	@Autowired
	private AccountDAO accountDAO;

	@Override
	public GenericDAO<Payment> getDAO() {
		return paymentDAO;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addPayment(Payment payment) {
		float sum = payment.getAmount();
		float accountFromBalance = payment.getAccountFrom().getBalance();
		float accountToBalance = payment.getAccountTo().getBalance();
		payment.getAccountFrom().setBalance(accountFromBalance - sum);
		payment.getAccountTo().setBalance(accountToBalance + sum);
		paymentDAO.add(payment);
		accountDAO.update(payment.getAccountFrom());
		accountDAO.update(payment.getAccountTo());
	}

}
