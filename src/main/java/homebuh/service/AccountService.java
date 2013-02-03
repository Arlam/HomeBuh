package homebuh.service;

import homebuh.dao.AccountDAO;
import homebuh.entities.Account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccountService {

	@Autowired
	private AccountDAO accountDAOImpl;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Account> getAccounts() {
		return accountDAOImpl.getAll();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Integer addAccount(Account account) {
		return accountDAOImpl.add(account);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Account get(Integer id) {
		return accountDAOImpl.get(id);
	}

}
