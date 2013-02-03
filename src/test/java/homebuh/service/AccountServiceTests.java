package homebuh.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/homebuh-servlet.xml")
public class AccountServiceTests {
	@Autowired
	private AccountService accountService;

	@Test
	public void testAutowired() {
		assertNotNull(accountService);
	}
}
