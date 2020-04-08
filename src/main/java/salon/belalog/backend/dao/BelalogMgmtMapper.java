package salon.belalog.backend.dao;

import org.apache.ibatis.annotations.Mapper;
import salon.belalog.backend.dto.BelalogCustDto;

@Mapper
public interface BelalogMgmtMapper {
	public BelalogCustDto selectCustBasicInfoByCustNm(BelalogCustDto belalogCustDto) throws Exception;
	
	public BelalogCustDto selectCustBasicInfoByCustNo(BelalogCustDto belalogCustDto) throws Exception;

	public int insertCustBasicInfo(BelalogCustDto belalogCustDto);
	
	public int updateCustBasicInfo(BelalogCustDto belalogCustDto);
}