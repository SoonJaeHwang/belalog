package salon.belalog.backend.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.apache.commons.lang.StringUtils;

import salon.belalog.backend.dao.BelalogMgmtMapper;
import salon.belalog.backend.dto.BelalogCustDto;

@Service
public class BelalogMgmtServiceImpl implements BelalogMgmtService {
	@Autowired
	private BelalogMgmtMapper belalogMgmtMapper;
	
	@Override
	public BelalogCustDto selectCustBasicInfo(BelalogCustDto belalogCustDto) throws Exception {
		if (!StringUtils.isEmpty(belalogCustDto.getCustNo())) {
			return belalogMgmtMapper.selectCustBasicInfoByCustNo(belalogCustDto);
		} else {
			return belalogMgmtMapper.selectCustBasicInfoByCustNm(belalogCustDto);
		}
	}
	
	@Override
	public String saveCustBasicInfo(BelalogCustDto belalogCustDto) throws Exception {
		String resutlMsg = "0000";
		
		if (StringUtils.isEmpty(belalogCustDto.getCustNo())) {	// 고객 등록
			if (belalogMgmtMapper.selectCustBasicInfoByCustNm(belalogCustDto) != null) {
				resutlMsg += "기등록된 고객입니다.";
				throw new Exception(resutlMsg);
			}
			
			if (belalogMgmtMapper.insertCustBasicInfo(belalogCustDto) != 1) {
				resutlMsg += "고객 등록에 실패하였습니다.";
				throw new Exception(resutlMsg);
			}
		} else {							// 고객 수정
			if (belalogMgmtMapper.updateCustBasicInfo(belalogCustDto) != 1) {
				resutlMsg += "고객 수정에 실패하였습니다.";
				throw new Exception(resutlMsg);
			}
		}
		
		return resutlMsg;
	}
}