package salon.belalog.backend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import salon.belalog.backend.dao.BelalogMgmtMapper;
import salon.belalog.backend.dto.BelalogCustDto;

/**
 * 
 * @author HSJ
 * @ref https://antdev.tistory.com/31
 */
@Controller
public class BelalogMgmtController {
	@Autowired
	private BelalogMgmtMapper belalogMgmtMapper;

	@RequestMapping(value={"/belalog/backend/main"})
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}

	@RequestMapping(value={"/belalog/backend/belalogMgmtMain"})
	public String salonMgmtMain(HttpServletRequest request, ModelMap model) throws Exception {
		BelalogCustDto belalogCustDto = new BelalogCustDto();
		
		belalogCustDto.setCustNo("202003000002");
		
		belalogCustDto = belalogMgmtMapper.selectCustBasicInfo(belalogCustDto);
		
		model.addAttribute("belalogCustDto", belalogCustDto);
		
		return "belalog/backend/belalogMgmtMain";
	}
}