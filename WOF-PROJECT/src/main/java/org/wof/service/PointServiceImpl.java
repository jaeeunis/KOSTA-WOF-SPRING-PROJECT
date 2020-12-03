package org.wof.service;

import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractVO;
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
	
	@Transactional
	@Override
	public int ChargingService(PointVO point, MemberVO member){
		
		log.info("����Ʈ ����" + point);
		
		//����Ʈ ����
		pointMapper.Charging(point);
		
		//member���� total_point��������
		int balance = pointMapper.getTotalpoint(point);
		
		//point_type => "0:����", 1:����, 2:����, 3:����, 4:����, (5:�Ա�, 6:ȯ��)
		point.setPoint_type(0);
		
		//point_balance
		System.out.println("service point : "+point);
		point.setPoint_balance(balance);
		
		//���� ���� Ȯ��
		int chargingResult = pointMapper.ChargingList(point);
		
		return chargingResult;
	}
	
	@Override
	public int WithdrawService(PointVO point, MemberVO member) {
		
		log.info("����Ʈ ����" + point);
		
		//����Ʈ ����
		pointMapper.Withdraw(point);
		
		//member���� total_point��������
		int balance = pointMapper.getTotalpoint(point);
		
		//point_type => 0:����, "1:����", 2:����, 3:����, 4:����, (5:�Ա�, 6:ȯ��)
		point.setPoint_type(1);
		
		//point_balance
		System.out.println("service point : "+point);
		point.setPoint_balance(balance);
		
		/*if(member.getTotal_point() < point.getPoint_amount()){
			throw new BalanceInsufficientException("�ܰ� ���� :"+(point.getPoint_amount()-member.getTotal_point())+"�� ���ڶ��ϴ�.");
		}*/
		
		//���⿩�� Ȯ�� (���� ����)
		int withdrawResult = pointMapper.WithdrawList(point);
		
		return withdrawResult;
	}
	
	@Override
	public int PaymentInService(PointVO point, ContractVO contract) {
		
		log.info("����Ʈ ����" + point);
		
		//pointMapper.getContract(contract);

		//contract.setBusiness_register_no(contract.getBusiness_register_no());
		
		point.setPoint_owner(contract.getClient());
		point.setPoint_amount(contract.getProj_estimate());
		point.setPoint_contents(contract.getProj_title());
		point.setPoint_chg_date(contract.getProj_start_date());
		
		log.error("-------------Ȯ��------------"+point);
		//����Ʈ ����
		pointMapper.PaymentFrom(point);
		
		//member���� total_point��������
		int balance = pointMapper.getTotalpoint(point);
		
		//point_balance
		System.out.println("member���� total_point������ �� : " + point);
		point.setPoint_balance(balance);
		
		//���� (���� )
		pointMapper.PaymentFromList(point);
		
		
		//����Ʈ ����
		pointMapper.HoldFrom(point);
		
		//member���� total_point��������
		int balance2 = pointMapper.getTotalpoint(point);
		
		//point_balance
		System.out.println("member���� total_point������ �� : " + point);
		point.setPoint_balance(balance2);
		
		//���� (���� )
		pointMapper.PaymentFromList(point);
		
		//�������� Ȯ�� (���� ����)
		int result = pointMapper.PaymentFrom(point);
				
		return result;
		
	}

	@Override
	public int PaymentOutService(PointVO point, MemberVO member, ContractSourceVO contract) {
		
		log.info("����Ʈ ����" + point);
		
		//����Ʈ ����
		pointMapper.PaymentTo(point);
		
		//member���� total_point��������
		int balance = pointMapper.getTotalpoint(point);
		
		//point_type => 0:����, 1:����, 2:����, 3:����, "4:����", (5:�Ա�, 6:ȯ��)
		point.setPoint_type(4);
		
		//point_balance
		System.out.println("member���� total_point������ �� : " + point);
		point.setPoint_balance(balance);
		
		//�������� Ȯ�� (���� ����)
		int paymentOutResult = pointMapper.PaymentToList(point);
		
		return paymentOutResult;
	}

	@Override
	public List<PointVO> ListService(MemberVO member, PointVO point, Standard standard) {
			
		member = pointMapper.getMember_no(member);
		
		member.getReal_name();
		
		point.setPoint_owner(member.getMember_no());
		
		return pointMapper.getList(point);
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
