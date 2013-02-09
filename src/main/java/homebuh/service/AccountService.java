package homebuh.service;

import homebuh.dao.AccountDAO;
import homebuh.dao.GenericDAO;
import homebuh.entities.Account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService extends GenericService<Account> {

	@Autowired
	private AccountDAO accountDAOImpl;

	@Override
	public GenericDAO<Account> getDAO() {
		return accountDAOImpl;
	}

}
