  
package org.wof.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class FollowProjectVO implements Serializable {
	
	private String followproject_no;
	private String related_proj;
	private String related_mem;
	
}