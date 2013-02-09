package homebuh.controller;

import homebuh.entities.AccStatus;
import homebuh.entities.AccType;
import homebuh.entities.Account;
import homebuh.entities.Payment;
import homebuh.service.AccStatusService;
import homebuh.service.AccTypeService;
import homebuh.service.AccountService;
import homebuh.service.PaymentService;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccountsController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private AccStatusService accStatusService;

	@Autowired
	private AccTypeService accTypeService;

	@Autowired
	private PaymentService paymentService;

	private static final String ORDER_RESULTS = "orderResults";
	private static final String MAX_RESULTS = "maxResults";

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
	public ModelAndView getHomePage() {

		AccStatus activAccStatus = accStatusService.get(1);
		List<Account> debetAccs = getAccounts(accTypeService.get(1),
				activAccStatus);
		List<Account> credAccs = getAccounts(accTypeService.get(2),
				activAccStatus);
		List<Account> userAccounts = getAccounts(accTypeService.get(3),
				activAccStatus);

		final Map<String, Object> params = new HashMap<String, Object>();
		final Map<String, Boolean> orders = new HashMap<String, Boolean>();
		orders.put("payDate", false);
		params.put(ORDER_RESULTS, orders);
		params.put(MAX_RESULTS, 10);
		List<Payment> payments = paymentService.find(params);

		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("payments", payments);
		modelAndView.addObject("payment", new Payment());
		modelAndView.addObject("accountsFrom", debetAccs);
		modelAndView.addObject("accountsTo", credAccs);
		modelAndView.addObject("accounts", userAccounts);

		return modelAndView;
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
		Map<String, Object> params = new HashMap<String, Object>();

		List<Account> accounts = accountService.find(params);
		model.addAttribute("accounts", accounts);
		return "accounts";
	}

	@RequestMapping(value = "/addAccount", method = RequestMethod.GET)
	public String addAccount(Map<String, Object> map) {
		Account account = new Account();
		List<Account> accounts = accountService.getAll();
		map.put("account", account);
		map.put("accounts", accounts);
		return "addAccount";
	}

	@RequestMapping(value = "/addAccount", method = RequestMethod.POST)
	public String createAccount(@ModelAttribute("account") Account account) {
		account.setStatus(accStatusService.get(1));
		accountService.add(account);
		return "redirect:addAccount";
	}

	public List<Account> getAccounts(AccType type, AccStatus status) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("status", status);
		params.put("type", type);
		return accountService.find(params);
	}
}
