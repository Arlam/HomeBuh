package homebuh.dao.impl;

import homebuh.dao.AccounStatusDAO;
import homebuh.entities.AccStatus;

import org.springframework.stereotype.Repository;

@Repository
public class AccountStatusDAOImpl extends HibernateGenericDAO<AccStatus>
		implements AccounStatusDAO {

	public AccountStatusDAOImpl() {
		super(AccStatus.class);
	}

}
