package homebuh.dao.impl;

import homebuh.dao.AccountTypeDAO;
import homebuh.entities.AccType;

import org.springframework.stereotype.Repository;

@Repository
public class AccountTypeDAOImpl extends HibernateGenericDAO<AccType> implements
		AccountTypeDAO {

	public AccountTypeDAOImpl() {
		super(AccType.class);
	}

}
