package homebuh.dao.impl;

import homebuh.dao.AccountDAO;
import homebuh.entities.Account;

import org.springframework.stereotype.Repository;

@Repository("AccountDAO")
public class AccountDAOImpl extends HibernateGenericDAO<Account> implements
		AccountDAO {

	public AccountDAOImpl() {
		super(Account.class);
	}

}
