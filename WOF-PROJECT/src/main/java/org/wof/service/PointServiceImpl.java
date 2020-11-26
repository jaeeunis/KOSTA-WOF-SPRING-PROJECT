package org.wof.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.stereotype.Service;
import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
import org.wof.domain.Standard;
import org.wof.mapper.PointMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PointServiceImpl implements PointService {

	@Setter(onMethod_ = @Autowired)
	private PointMapper pointMapper;

	Date date = new Date();
	String currentDate = new SimpleDateFormat("yy-MM-dd").format(date);
	
	
	@Override
	public int ChargingService(PointVO point){
		
		MemberVO member = new MemberVO();
		
		log.info("����Ʈ ����" + point);
		
		//����Ʈ ����
		pointMapper.Charging(point);
		
		//point_type => "0:����", 1:����, 2:����
		point.setPoint_type(0);
		
		//point_balance
		int balance = member.getTotal_point();
		balance += point.getPoint_amount();
		
		//log.info("point type:" + point.getPoint_type());
		
		//�������� Ȯ�� (���� ����)
		int chargingResult = pointMapper.ChargingList(point);
		
		return chargingResult;
	}
	
	@Override
	public int WithdrawService(PointVO point) {
		
		log.info("����Ʈ ����" + point);
		
		MemberVO member = new MemberVO();
		
		//����Ʈ ����
		pointMapper.Withdraw(point);
		
		//point_type => 0:����, "1:����", 2:����
		point.setPoint_type(1);
		
		//point_balance
		int balance = member.getTotal_point();
		
		if(member.getTotal_point() >= point.getPoint_amount()){
			balance -= point.getPoint_amount();
		}
		/*if(member.getTotal_point() < point.getPoint_amount()){
			throw new BalanceInsufficientException("�ܰ� ���� :"+(point.getPoint_amount()-member.getTotal_point())+"�� ���ڶ��ϴ�.");
		}*/
		point.setPoint_balance(balance);
		
		//���⿩�� Ȯ�� (���� ����)
		int withdrawResult = pointMapper.WithdrawList(point);
		
		return withdrawResult;
	}
	
	/*@Override
	public int getPointTotalService(MemberVO member) {
		
		return pointMapper.getPointTotal(member);
	}*/
	
	
	@Override
	public List<PointVO> ListService(Standard standard) {
			
		return pointMapper.getListPaging(standard);
	}
	
	@Override
	public int getTotalService(Standard standard) {
		
		return pointMapper.getTotalCount(standard);
	}
	
	@Override
	public int PaymentService(PointVO point){
		return 1;
	}

	@Override
	public int pwCheckService(String userpw) {

		return pointMapper.pwCheck(userpw);
	}





	




}
