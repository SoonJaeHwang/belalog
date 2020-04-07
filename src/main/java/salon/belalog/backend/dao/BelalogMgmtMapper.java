package salon.belalog.backend.dao;

import org.apache.ibatis.annotations.Mapper;
import salon.belalog.backend.dto.BelalogCustDto;

@Mapper
public interface BelalogMgmtMapper {
	public BelalogCustDto selectCustBasicInfo(BelalogCustDto belalogCustDto) throws Exception;
}