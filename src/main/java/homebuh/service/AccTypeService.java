package homebuh.service;

import homebuh.dao.AccountTypeDAO;
import homebuh.dao.GenericDAO;
import homebuh.entities.AccType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccTypeService extends GenericService<AccType> {
	@Autowired
	private AccountTypeDAO accountTypeDAO;

	@Override
	public GenericDAO<AccType> getDAO() {
		return accountTypeDAO;
	}
}
