package homebuh.service;

import homebuh.dao.GenericDAO;
import homebuh.dao.impl.AccountStatusDAOImpl;
import homebuh.entities.AccStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccStatusService extends GenericService<AccStatus> {

	@Autowired
	private AccountStatusDAOImpl accountStatusDAO;

	@Override
	public GenericDAO<AccStatus> getDAO() {
		return accountStatusDAO;
	}
}
