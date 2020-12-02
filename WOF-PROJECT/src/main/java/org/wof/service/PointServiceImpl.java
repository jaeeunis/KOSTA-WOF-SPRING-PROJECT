package org.wof.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;
import org.wof.mapper.PointMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PointServiceImpl implements PointService {

	@Setter(onMethod_= @Autowired)
	private PointMapper pointMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	Date date = new Date();
	String currentDate = new SimpleDateFormat("yy-MM-dd").format(date);
	
	
	@Override
	public int ChargingService(PointVO point, MemberVO member){
		
		
		log.info("����Ʈ ����" + point);
		
		//����Ʈ ����
		pointMapper.Charging(point);
		
		//point_type => "0:����", 1:����, 2:����
		point.setPoint_type(0);
		
		//point_balance
		//String userId = member.getMember_no();
		
		int balance = pointMapper.pointBalance(point);
		
		point.setPoint_balance(member.getTotal_point());
		
		
		//log.info("point type:" + point.getPoint_type());
		
		//�������� Ȯ�� (���� ����)
		int chargingResult = pointMapper.ChargingList(point);
		
		return chargingResult;
	}
	
	@Override
	public int WithdrawService(PointVO point, MemberVO member) {
		
		log.info("����Ʈ ����" + point);
		
		
		//����Ʈ ����
		pointMapper.Withdraw(point);
		
		//point_type => 0:����, "1:����", 2:����
		point.setPoint_type(1);
		
		//point_balance
		
		/*if(member.getTotal_point() < point.getPoint_amount()){
			throw new BalanceInsufficientException("�ܰ� ���� :"+(point.getPoint_amount()-member.getTotal_point())+"�� ���ڶ��ϴ�.");
		}*/
		point.setPoint_balance(member.getTotal_point());
		
		//���⿩�� Ȯ�� (���� ����)
		int withdrawResult = pointMapper.WithdrawList(point);
		
		return withdrawResult;
	}
	
	

	@Override
	public int PaymentFromService(PointVO point, MemberVO member, ProjectVO project) {
	
		
	if(project.getProj_status() == 2){
		//����Ʈ ����
		pointMapper.PaymentFrom(point);
		//point_type => 0:����, 1:����, "2:����", 3:�Ա�
		point.setPoint_type(2);
	}
	
	log.info("����Ʈ  ����" + point);
		//point_balance
		
		//point.setPoint_balance(member.getTotal_point());
		
		//�������� Ȯ�� (���� ����)
		int paymentResult = pointMapper.PaymentList(point);
		
		return paymentResult;
	}

	@Override
	public int PaymentToService(PointVO point, MemberVO member) {
		
		
		pointMapper.PaymentTo(point);
		//point_type => 0:����, "1:����", 2:����, "3:�Ա�"
		point.setPoint_type(3);
		
		//point_balance
		
		//point.setPoint_balance(member.getTotal_point());
		
		//�������� Ȯ�� (���� ����)
		int paymentResult = pointMapper.PaymentList(point);
		
		return paymentResult;
	}
	
	
	@Override
	public List<PointVO> ListService(Standard standard) {
			
		return pointMapper.getListPaging(standard);
	}
	
	@Override
	public int getTotalService(Standard standard) {
		
		return pointMapper.getTotalCount(standard);
	}
	
	@Override
	public String pwCheckService(MemberVO member) {
		
		String data = "0";
		
		//Member�� mapper���� �����°�ü ��������
		String pw = pointMapper.pwCheck(member.getUserid());
		
		if(passwordEncoder.matches(member.getUserpw(), pw)){
			//���� ��
			data = "1";
		}
		
		return data;
	}






	




}
