package salon.belalog.backend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import salon.belalog.backend.dto.BelalogCustDto;
import salon.belalog.backend.service.BelalogMgmtService;

/**
 * Add annotation for test
 */
/**
 * 
 * @author HSJ
 * @ref https://antdev.tistory.com/26 - Creating Spring Boot MVC
 */
@Controller
public class BelalogMgmtController {
	
	@Autowired
	private BelalogMgmtService belalogMgmtService;
	
	@Autowired
    private MappingJackson2JsonView jsonView;

	@RequestMapping(value={"/belalog/backend/main"})
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}

	@RequestMapping(value={"/belalog/backend/belalogMgmtMain"})
	public String salonMgmtMain(HttpServletRequest request, ModelMap model) throws Exception {
		String custNo = request.getParameter("custNo");
		
		model.put("custNo", custNo);
		
		return "belalog/backend/belalogMgmtMain";
	}
	
	@RequestMapping(value={"/belalog/backend/searchCustBasicInfo"}, method=RequestMethod.POST)
	public ModelAndView searchCustBasicInfo(@RequestBody BelalogCustDto belalogCustDto, HttpServletRequest request, ModelMap model) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		belalogCustDto = belalogMgmtService.selectCustBasicInfo(belalogCustDto);

		mav.setView(jsonView);
		mav.addObject("belalogCustDto", belalogCustDto);
		
		return mav;
	}
	
	@RequestMapping(value={"/belalog/backend/saveCustBasicInfo"}, method=RequestMethod.POST)
	public ModelAndView saveCustBasicInfo(@RequestBody BelalogCustDto belalogCustDto, HttpServletRequest request, ModelMap model) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setView(jsonView);
		mav.addObject("belalogCustDto", belalogCustDto);
		mav.addObject("resultMsg", belalogMgmtService.saveCustBasicInfo(belalogCustDto));
		
		return mav;
	}
}