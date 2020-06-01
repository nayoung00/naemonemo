package com.nmnm.gms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nmnm.gms.domain.GroupAccount;
import com.nmnm.gms.service.GroupAccountService;

@Controller
@RequestMapping("/account")
public class GroupAccountController {

	static Logger logger = LogManager.getLogger(GroupAccountController.class);

	@Autowired
	ServletContext servletContext;

	@Autowired
	GroupAccountService groupAccountService;

	public GroupAccountController() {
		logger.debug("GroupAccountController 생성됨!");
	}

	@GetMapping("bankForm")
	public void form() throws Exception {
	}

	@PostMapping("bankAdd")
	public String add(GroupAccount groupAccount) throws Exception {
		groupAccountService.add(groupAccount);
		return "redirect:bankList";
	}

	@GetMapping("bankDelete")
	public String delete(int groupNo) throws Exception {
		if (groupAccountService.delete(groupNo) > 0) {
			return "redirect:list";
		} else {
			throw new Exception("삭제할 번호가 유효하지 않습니다.");
		}
	}

	@GetMapping("bankDetail")
	public void detail(int groupNo, Model model) throws Exception {
		GroupAccount groupAccount = groupAccountService.get(groupNo);
		model.addAttribute("groupAccount", groupAccount);
	}

	@GetMapping("bankList")
	public void list(Model model) throws Exception {
		List<GroupAccount> groupAccounts = groupAccountService.list();
		model.addAttribute("bankList", groupAccounts);
	}

	@GetMapping("bankUpdateForm")
	public void updateForm(int groupNo, Model model) throws Exception {
		model.addAttribute("groupAccount", groupAccountService.get(groupNo));
		System.out.println(groupNo);
	}

	@PostMapping("bankUpdate")
	public String update(GroupAccount groupAccount) throws Exception {
		groupAccountService.update(groupAccount);
		return "redirect:bankList";
	}
}
