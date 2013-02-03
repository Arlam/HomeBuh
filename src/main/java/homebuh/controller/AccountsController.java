package homebuh.controller;

import homebuh.entities.Account;
import homebuh.entities.Payment;
import homebuh.service.AccStatusService;
import homebuh.service.AccountService;
import homebuh.service.PaymentService;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountsController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private AccStatusService accStatusService;

	@Autowired
	private PaymentService paymentService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Account.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String value) {
				Integer accId = Integer.parseInt(value);
				Account access = accountService.get(accId);
				setValue(access);
			}
		});
	}

	@RequestMapping(value = "/payments")
	public String get() {
		return "payments";
	}

	@RequestMapping(value = "/home")
	public String getHomePage(ModelMap model) {
		List<Account> accounts = accountService.getAccounts();
		model.addAttribute("accounts", accounts);

		Payment newPayment = new Payment();
		model.addAttribute("payment", newPayment);

		List<Payment> payments = new ArrayList<Payment>();
		model.addAttribute("payments", payments);

		List<Account> accountsFrom = accountService.getAccounts();
		List<Account> accountsTo = accountService.getAccounts();
		model.addAttribute("accountsFrom", accountsFrom);
		model.addAttribute("accountsTo", accountsTo);
		return "home";
	}

	@RequestMapping(value = "/addPayment", method = RequestMethod.POST)
	public String addPayment(@ModelAttribute("payment") Payment payment,
			BindingResult result) {
		payment.setPayDate(new Date());
		paymentService.addPayment(payment);
		return "redirect:home";
	}

	@RequestMapping(value = "/accounts")
	public String getAccounts(ModelMap model) {
		List<Account> accounts = accountService.getAccounts();
		model.addAttribute("accounts", accounts);
		return "accounts";
	}

	@RequestMapping(value = "/addAccount", method = RequestMethod.GET)
	public String addAccount(Map<String, Object> map) {
		Account account = new Account();
		List<Account> accounts = accountService.getAccounts();
		map.put("account", account);
		map.put("accounts", accounts);
		return "addAccount";
	}

	@RequestMapping(value = "/addAccount", method = RequestMethod.POST)
	public String createAccount(@ModelAttribute("account") Account account) {
		account.setStatus(accStatusService.getAccountStatus(1));
		accountService.addAccount(account);
		return "redirect:addAccount";
	}

}
