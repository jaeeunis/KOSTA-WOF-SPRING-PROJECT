package org.wof.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.wof.domain.PageDTO;
import org.wof.domain.PartnersVO;
import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;
import org.wof.mapper.MemberMapper;
import org.wof.mapper.ProjectMapper2;
import org.wof.service.ProjectService2;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/project/*")
@AllArgsConstructor

public class ProjectController2 {
	
	private ProjectService2 projectService2;
	private MemberMapper memberMapper;
	private ProjectMapper2 projectMapper2;
	
	@PreAuthorize("hasRole('ROLE_PARTNERS')")
	@GetMapping("recommend")
	public void projectRecommendList(Principal principal, Standard stand, Model model){
		log.info("recommend List 실행");
		String related_member = memberMapper.memberNo(principal.getName());
		PartnersVO vo = memberMapper.partnersInfo(related_member);
		int total = projectMapper2.totalProject(stand);
		model.addAttribute("pageDto", new PageDTO(stand, total));
		model.addAttribute("projects", projectService2.listRecommendProject(vo));
	}
	
	@PreAuthorize("hasRole('ROLE_PARTNERS')")
	@GetMapping("followlist")
	public void projectFollowList(Principal principal, Standard standard, Model model){
		String related_member = memberMapper.memberNo(principal.getName());
		model.addAttribute("follow", projectService2.listFollowProject(related_member));		
	}
	
	@PreAuthorize("hasRole('ROLE_PARTNERS')")
	@GetMapping("apply_project")
	public void projectApplyList(Principal principal, Standard standard, Model model, HttpServletRequest request){
		log.info("apply project list 실행");
		HttpSession session = request.getSession();
		String related_member = memberMapper.memberNo(principal.getName());
		PartnersVO vo = memberMapper.partnersInfo(related_member);
		session.setAttribute("partners", vo);	
	}
	
	@GetMapping("qna")
	public String pnaRegister(Principal principal){
		log.info("qna");
		return "/qna/question-register-jaeeun";
	}
	
	@PostMapping("mailqna")
	public ResponseEntity<Integer> mailSending(QuestionVO vo){
		log.info("qna");
		System.out.println(vo);
		projectService2.QnaSendMail(vo);
		return new ResponseEntity<Integer>(1, HttpStatus.OK);
	}
	
	@GetMapping("meeting")
	public void partnerDashBoard(Principal principal, Model model,HttpServletRequest request){
		log.info("파트너스 meeting 실행");
	    HttpSession session = request.getSession();
		String related_member = memberMapper.memberNo(principal.getName());
		PartnersVO vo = memberMapper.partnersInfo(related_member);
		session.setAttribute("partners", vo);
		model.addAttribute("meets", projectService2.listMeeting(related_member));
	}
	
}
