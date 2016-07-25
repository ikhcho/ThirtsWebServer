package com.thirts.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.thirts.member.NewaccountVo;
import com.thirts.member.LoginService;
import com.thirts.member.LoginVo;
import com.thirts.speed.SpeedService;
import com.thirts.speed.SpeedVo;

@Controller
public class HomeController {
	@Autowired
	@Qualifier("speedService")
	SpeedService sService;

	@Autowired
	@Qualifier("loginService")
	LoginService lService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// ========================= Login ============================//
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "login/login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public ModelAndView selectId(LoginVo vo) {

		ModelAndView mv = new ModelAndView();
		LoginVo checkaccount = lService.SearchAccount(vo.getId());

		if (checkaccount != null && vo.getId() != "") {
			if (vo.getId().equals(checkaccount.getId()) && vo.getPassword().equals(checkaccount.getPassword())) {
				mv.setViewName("main/web/home");
				mv.addObject("vo", vo);
				return mv;
			} else {
				mv.setViewName("login/loginFail");
				return mv;
			}
		} else {
			mv.setViewName("login/loginFail");
			return mv;
		}
	}

	@RequestMapping(value = "/login2")
	public String login2() {
		return "login/login2";
	}

	@RequestMapping(value = "/register")
	public String register() {
		return "login/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView insertAccount(NewaccountVo vo) {

		ModelAndView mv = new ModelAndView();

		if (vo.getPassword().equals(vo.getPassword_check())) {
			lService.SaveAccount(vo);
			mv.setViewName("login/login");
			return mv;
		} else {
			mv.setViewName("login/registerFail");
			return mv;
		}
	}

	//========================main================================//
		
	
		//=======================android============================//
		@RequestMapping(value = "/main/android/request_recent_log", method = RequestMethod.GET)
		public ModelAndView android_recent_log(@RequestParam(value = "id" , required=false, defaultValue="1") String id ){
			
			SpeedVo sv = sService.SearchSpeed(id);
			ModelAndView mv = new ModelAndView();
			mv.addObject("sv", sv);
			mv.setViewName("main/android/request_recent_log");
			return mv;
		}
	
		//=========================================================//
		
		//=======================web===============================//
		@RequestMapping(value = "/home")
		public String home() {
			return "main/web/home";
		}
		//=========================================================//
	
		//=======================log================================//
		@RequestMapping(value = "/recent", method = RequestMethod.GET)
		public ModelAndView recent() {
			SpeedVo sv = sService.SearchSpeed("admin");
			ModelAndView mv = new ModelAndView();
			mv.addObject("sv", sv);
			mv.setViewName("main/log/recent");
			return mv;
		}
		
		@RequestMapping(value = "/all")
		public ModelAndView all(Model model) {
			List<SpeedVo> LSV = sService.selectAllSpeed();
	
			ModelAndView mv = new ModelAndView();
			mv.addObject("ListSpeedVo", LSV);
			mv.setViewName("main/log/all");
			return mv;
		}

		@RequestMapping(value = "/tracking", method = RequestMethod.GET)
		public ModelAndView tracking(Model model) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("main/log/tracking");
			return mv;
		}
		//==========================================================//
	
		//========================db=================================//
		@RequestMapping(value = "/db/receivedata", method = RequestMethod.GET)
		public String receivedata(@RequestParam(value = "max_v", required = false, defaultValue = "1") int max_v,
				@RequestParam(value = "average_v", required = false, defaultValue = "2") int average_v,
				@RequestParam(value = "distance", required = false, defaultValue = "3") int distance,
				@RequestParam(value = "time", required = false, defaultValue = "4") int time,
				@RequestParam(value = "macaddress", required = false, defaultValue = "5") String macaddress) {
			SpeedVo vo = new SpeedVo();
			vo.setMax_v(max_v);
			vo.setAverage_v(average_v);
			vo.setDistance(distance);
			vo.setTime(time);
			vo.setMac(macaddress);
			sService.SaveSpeed(vo);
			return "db/receivedata";
		}
		//=============================================================//
		
}