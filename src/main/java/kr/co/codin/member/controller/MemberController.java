package kr.co.codin.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.member.service.MemberService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberCareer;
import kr.co.codin.repository.domain.MemberSearch;
import kr.co.codin.repository.domain.MemberSkill;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
//	@RequestMapping("/signupForm.do")
//	public void signupForm() throws Exception {}
	
	@RequestMapping("/signup.do")
	public String signup(Member member) throws Exception {
//		System.out.println(member);
		service.signup(member);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	@RequestMapping("/list.do")
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.list());
	}

	
//	@RequestMapping("/loginForm.do")
//	public void loginForm() throws Exception {}
	
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session) throws Exception {
		if (service.login(member) != null) {
			session.setAttribute("user", service.login(member));
//			System.out.println(service.login(member).getMemberGrade());
			if(service.login(member).getMemberGrade().equals("a")) {
				return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
			}
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "myPage.do";			
		}
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	@RequestMapping("/myPage.do")
	public void myPage(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("user");
		int memberNo = member.getMemberNo();
		model.addAttribute("member", service.mypage(memberNo));
		model.addAttribute("memberSkill", service.myskill(memberNo));
		model.addAttribute("memberCareer", service.mycareer(memberNo));
	}
	
	@RequestMapping("/updateForm.do")
	public void updateForm (HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("user");
		int memberNo = member.getMemberNo();
		model.addAttribute("member", service.mypage(memberNo));
		model.addAttribute("memberSkill", service.myskill(memberNo));
		model.addAttribute("memberCareer", service.mycareer(memberNo));
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	@RequestMapping("/edit.do")
	public String editProfile(Member member, MemberSkill memberSkill, @RequestParam(value="memberSkillNo", required=false) List<Integer> memberSkillNoList, MemberCareer memberCareer) {
//		System.out.println(member);
//		System.out.println(memberSkillNoList);
		if (memberSkillNoList != null) {
				memberSkill.setMemberSkillNoList(memberSkillNoList);
		}
//		System.out.println("controller : " + memberSkill.getMemberSkillNoList());
		service.editProfile(member, memberSkill, memberCareer);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "myPage.do";
	}
	
	@RequestMapping("/detail.do")
	public void detail(int memberNo, Model model) {
		model.addAttribute("member", service.memberInfo(memberNo));
		model.addAttribute("memberSkill", service.myskill(memberNo));
		model.addAttribute("memberCareer", service.mycareer(memberNo));
	}
	
	@RequestMapping("/updateMemberForm.do")
	public void updateMemberForm (int memberNo, Model model) {
		model.addAttribute("member", service.memberInfo(memberNo));
		model.addAttribute("memberSkill", service.myskill(memberNo));
		model.addAttribute("memberCareer", service.mycareer(memberNo));
	}
	
	@RequestMapping("/upgrade.do")
	public String editGrade(Member member) {
		service.editGrade(member);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "detail.do?memberNo=" + member.getMemberNo();
	}
	
	@RequestMapping("/insertCareerForm.do")
	public void insertCareerForm(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("user");
		int memberNo = member.getMemberNo();
		model.addAttribute("member", service.mypage(memberNo));
		model.addAttribute("memberSkill", service.myskill(memberNo));
		model.addAttribute("memberCareer", service.mycareer(memberNo));
	}
	
	@RequestMapping("/addCareer.do")
	public String addCareer(MemberCareer memberCareer) {
//		System.out.println(memberCareer);
		service.addCareer(memberCareer);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "myPage.do";
	}
	
	@RequestMapping("/deleteCareerAll.do")
	public String deleteCareerAll(HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		int memberNo = member.getMemberNo();
		service.deleteCareerAll(memberNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "myPage.do";
	}
	
	@RequestMapping("/deleteCareer.do")
	public void deleteCareer(MemberCareer memberCareer) {
		service.deleteCareer(memberCareer);
	}
	
	@RequestMapping("/deleteAccount.do")
	@ResponseBody
	public String deleteAccount(HttpSession session, int memberNo) {
		session.invalidate();
		service.deleteAccount(memberNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
//	@RequestMapping(value="/search.do")
//	@ResponseBody
//	public List<Member> searchMember(MemberSearch memberSearch) {
////		System.out.println(memberSearch);
//		return service.searchMember(memberSearch);
//	}
	
//	@RequestMapping(value="/search.do")
//	@ResponseBody
//	public List<Member> searchMember(MemberSearch memberSearch, Model model) {
////		System.out.println(memberSearch);
//		model.addAttribute("slist", service.searchMember(memberSearch));
//		return service.searchMember(memberSearch);
//	}

	@RequestMapping(value="/search.do")
	public void searchMember(MemberSearch memberSearch, Model model) {
//		System.out.println(memberSearch);
		model.addAttribute("list", service.searchMember(memberSearch));
	}
}
