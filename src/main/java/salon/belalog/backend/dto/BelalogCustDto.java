package salon.belalog.backend.dto;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class BelalogCustDto {
	private String custNo;		// 고객번호
	private String newCustNo;	// 신규고객번호
	private String custNm;		// 고객이름
	private String sex;			// 성별
	private String telNo;		// 연락처
	private String emailAdr;	// 이메일주소
	private String mgmtStaffNm;	// 담당직원이름
	private Date lastVsitDtm;	// 최종방문일자
	private String lastOrdDtl;	// 최종주문상세
	private String rmrk1;		// 비고
	private Date regDtm;		// 등록일자
}