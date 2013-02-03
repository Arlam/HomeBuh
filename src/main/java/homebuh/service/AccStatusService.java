package homebuh.service;

import homebuh.dao.impl.AccountStatusDAOImpl;
import homebuh.entities.AccStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccStatusService {

	@Autowired
	private AccountStatusDAOImpl accountStatusDAO;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public AccStatus getAccountStatus(Integer id) {
		return accountStatusDAO.get(id);
	}
}
