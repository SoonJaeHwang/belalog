package salon.belalog.backend.service;

import salon.belalog.backend.dto.BelalogCustDto;

public interface BelalogMgmtService {
	public BelalogCustDto selectCustBasicInfo(BelalogCustDto belalogCustDto) throws Exception;
	
	public String saveCustBasicInfo(BelalogCustDto belalogCustDto) throws Exception;
}