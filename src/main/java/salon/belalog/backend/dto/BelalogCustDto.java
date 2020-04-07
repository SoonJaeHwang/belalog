package salon.belalog.backend.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BelalogCustDto {
	private String custNo;		// 고객번호
	
	private String custNm;		// 고객이름
	
	private String sex;			// 성별
	
	private String telNo;		// 연락처
	
	private String emailAdr;	// 이메일주소
	
	private String mgmtStaffNm;	// 담당직원이름
	
	private Date lastVsitDtm;	// 최종방문일자
	
	private String lastOrdDtl;	// 최종주문상세
	
	private String rmrk1;		// 비고
	
	private Date regDtm;		// 등록일자

	public String getCustNo() {
		return custNo;
	}

	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}

	public String getCustNm() {
		return custNm;
	}

	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTelNo() {
		return telNo;
	}

	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}

	public String getEmailAdr() {
		return emailAdr;
	}

	public void setEmailAdr(String emailAdr) {
		this.emailAdr = emailAdr;
	}

	public String getMgmtStaffNm() {
		return mgmtStaffNm;
	}

	public void setMgmtStaffNm(String mgmtStaffNm) {
		this.mgmtStaffNm = mgmtStaffNm;
	}

	public Date getLastVsitDtm() {
		return lastVsitDtm;
	}

	public void setLastVsitDtm(Date lastVsitDtm) {
		this.lastVsitDtm = lastVsitDtm;
	}

	public String getLastOrdDtl() {
		return lastOrdDtl;
	}

	public void setLastOrdDtl(String lastOrdDtl) {
		this.lastOrdDtl = lastOrdDtl;
	}

	public String getRmrk1() {
		return rmrk1;
	}

	public void setRmrk1(String rmrk1) {
		this.rmrk1 = rmrk1;
	}

	public Date getRegDtm() {
		return regDtm;
	}

	public void setRegDtm(Date regDtm) {
		this.regDtm = regDtm;
	}
}