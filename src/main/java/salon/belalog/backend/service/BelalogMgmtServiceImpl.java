package salon.belalog.backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import salon.belalog.backend.dao.BelalogMgmtMapper;
import salon.belalog.backend.dto.BelalogCustDto;

@Service
public class BelalogMgmtServiceImpl implements BelalogMgmtService {
	@Autowired
	private BelalogMgmtMapper belalogMgmtMapper;
	
	@Override
	public BelalogCustDto selectCustBasicInfo(BelalogCustDto belalogCustDto) throws Exception {
		return belalogMgmtMapper.selectCustBasicInfo(belalogCustDto);
	}
}