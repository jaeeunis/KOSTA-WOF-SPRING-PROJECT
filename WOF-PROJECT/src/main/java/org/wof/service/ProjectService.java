package org.wof.service;

import java.util.List;

import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;

public interface ProjectService {
	public void create(ProjectVO p1);
	public ProjectVO read(String proj_id);
	public boolean update(ProjectVO p1);
	public boolean delete(String proj_id);
	public List<ProjectVO> getlist(Standard stand);
	public int getTotal(Standard stand);
	
}
