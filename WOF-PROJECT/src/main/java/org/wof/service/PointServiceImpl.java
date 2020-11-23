package org.wof.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
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
		
		log.info("����Ʈ ����" + point);
		
		MemberVO member = new MemberVO();

		member.setMember_no("member2");
		member.setTotal_point(point.getPoint_amount());
		
		log.info("member"+member);
		
		//���� ���� (DB�� ��)
		pointMapper.Charging(member);
		
		//point_type => "0:����", 1:����, 2:����
		point.setPoint_type(0);
		point.setPoint_owner("member2");
		
		
		
		//�������� Ȯ�� (���� ����)
		int chargingResult = pointMapper.ChargingList(point);
		
		return chargingResult;
	}
	
	@Override
	public int WithdrawService(PointVO point) {
		
		log.info("����Ʈ ����" + point);
		
		MemberVO member = new MemberVO();
		
		member.setMember_no("member2");
		member.setTotal_point(point.getPoint_amount());

		log.info("member"+member);
		
		/*if(member.getTotal_point() < point.getPoint_amount()){
			throw new BalanceInsufficientException("�ܰ� ���� :"+(point.getPoint_amount()-member.getTotal_point())+"�� ���ڶ��ϴ�.");
		}*/
		
		pointMapper.Withdraw(member);
		
		//���� ���� (DB�� ��)
		
		
		//point_type => 0:����, "1:����", 2:����
		point.setPoint_type(1);
		point.setPoint_owner("member2");
		
		//���⿩�� Ȯ�� (���� ����)
		int withdrawResult = pointMapper.WithdrawList(point);
		
		return withdrawResult;
	}
	
	@Override
	public int PaymentService(PointVO point){
		return 1;
	}


	@Override
	public List<PointVO> GetService(PointSearch search) {
		return null;
	}




}
