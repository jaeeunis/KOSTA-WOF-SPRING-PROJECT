package org.wof.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.FollowProjectVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProjectMapperTests {

	@Autowired
	private ProjectMapper2 projectMapper2;
	
/*	@Test
	public void testaddFollowProjectMapper() {
		FollowProjectVO vo = new FollowProjectVO();
		vo.setFollowproject_no("followproject1");
		vo.setRelated_member("member27");
		vo.setRelated_project("project1");
		log.info(projectMapper2.addFollowProject(vo));
	}*/
	
	@Test
	public void testdeleteFollowProjectMapper() {
		//로그인된 파트너 회원의 팔로우 프로젝트를 지울 수 있다.
		log.info(projectMapper2.deleteFollowProject("project1"));
	}

}


