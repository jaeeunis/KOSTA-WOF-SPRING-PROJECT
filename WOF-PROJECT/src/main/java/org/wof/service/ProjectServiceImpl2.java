package org.wof.service;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import lombok.AllArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.wof.domain.FollowProjectVO;
import org.wof.domain.MeetVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.QuestionVO;
import org.wof.domain.Standard;
import org.wof.mapper.ProjectMapper2;

@Service
@AllArgsConstructor
public class ProjectServiceImpl2 implements ProjectService2 {

	private ProjectMapper2 projectMapper2;
	private JavaMailSender mailSender;

	@Override
	public ProjectVO projectDetail(String proj_id) {
		return projectMapper2.projectDetail(proj_id);
	}

	@Override
	public int addFollowProject(FollowProjectVO vo) {
		return projectMapper2.addFollowProject(vo);
	}

	@Override
	public int deleteFollowProject(String followproject_no) {
		return projectMapper2.deleteFollowProject(followproject_no);
	}

	@Override
	public List<ProjectVO> listFollowProject(String related_member) {
		return projectMapper2.listFollowProject(related_member);
	}
	
	@Override
	public List<ProjectVO> listRecommendProject(PartnersVO vo) {
		return projectMapper2.listRecommendProject(vo);
	}

	@Override
	public FollowProjectVO detailFollowProject(String related_project, String related_member) {
		FollowProjectVO vo = new FollowProjectVO();
		vo.setRelated_member(related_member);
		vo.setRelated_project(related_project);
		return projectMapper2.detailFollowProject(vo);
	}
	
	@Override
	public List<ProjectVO> listRecommendProjectwithpaging(PartnersVO vo, Standard stand) {
		return projectMapper2.listRecommendProjectwithpaging(vo, stand);
	}
	
	@Override
	public int addMeeting(MeetVO vo) {
		return projectMapper2.addMeeting(vo);
	}
	
	@Override
	public int deleteMeeting(String meet_id) {
		return projectMapper2.deleteMeeting(meet_id);
	}
	
	@Override
	public List<MeetVO> listMeeting(String meet_req_mem) {
		return projectMapper2.listMeeting(meet_req_mem);
	}
	
	@Override
	public int updateMeeting(MeetVO vo) {
		return projectMapper2.updateMeeting(vo);
	}
	
	@Override
	public int totalList(Standard stand) {
		return projectMapper2.totalProject(stand);
	}
	
	@Override
	public void RecommendSendMail(String loginUser, Standard stand) {
		
			Random rm = new Random();
			int total = projectMapper2.totalProject(stand);
			String project_id = "project" + (rm.nextInt(total)+1);
			ProjectVO vo = projectMapper2.projectDetail(project_id);

	       MimeMessage message = mailSender.createMimeMessage();
	       MimeMessageHelper messageHelper;
	       
	       StringBuffer contents = new StringBuffer();
	       	contents.append("<h1>WOF")
	       	.append("현재 올라와 있는 프로젝트")
	       	.append(vo.getProj_title())
	       	.append(vo.getProj_detail())
	       	.append("</h1>");

	      try {

	         messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	          messageHelper.setFrom("wof@wof.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
	          messageHelper.setTo(loginUser); // 받는사람 이메일
	          messageHelper.setSubject("[WOF] 고객님에게 알맞은 프로젝트를 추천해드립니다."); // 메일제목은 생략이 가능하다
	          messageHelper.setText(contents.toString()); // 메일 내용

	      } catch (MessagingException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	       mailSender.send(message);
	}
	
	@Override
	public void QnaSendMail(QuestionVO vo) {
	       MimeMessage message = mailSender.createMimeMessage();
	       MimeMessageHelper messageHelper;
	       String contents = vo.getQuest_writer()+"님 의 문의내용입니다.";
	       contents += "[" + vo.getQuest_contents() + "]";
	       contents += " phone :" + vo.getQuest_userphone() + "문의하신 고객님의 연락처입니다.";
	       
	      try {
	    	  
	         messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	          messageHelper.setFrom(vo.getQuest_id()); // 보내는사람 생략하거나 하면 정상작동을 안함
	          messageHelper.setTo("wof.company.kosta@gmail.com"); // 받는사람 이메일
	          messageHelper.setSubject(vo.getQuest_title() + "[문의사항"+vo.getQuest_writer()+"님]"); // 메일제목은 생략이 가능하다
	          messageHelper.setText(contents); // 메일 내용

	      } catch (MessagingException e) {
	         e.printStackTrace();
	      }
	       mailSender.send(message);
		
	}



}