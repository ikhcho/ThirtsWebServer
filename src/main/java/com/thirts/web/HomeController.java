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

import com.thirts.speed.SpeedService;
import com.thirts.speed.SpeedVo;
import com.thirts.account.LoginService;
import com.thirts.account.LoginVo;
import com.thirts.main.MainService;
import com.thirts.main.MainVo;

@Controller
public class HomeController {
	@Autowired
	@Qualifier("speedService")
	SpeedService sService;

	
	@Autowired
	@Qualifier("loginService")
	LoginService lService;
	
	@Autowired
	@Qualifier("mainService")
	MainService mService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// ========================= Login ============================//
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "main/web/home";
	}

	@RequestMapping(value = "/login_check", method = RequestMethod.POST)
	public ModelAndView selectId(LoginVo vo) {

		ModelAndView mv = new ModelAndView();
		LoginVo checkaccount = lService.SearchAccount(vo.getId());

		if (checkaccount != null && vo.getId() != "") {
			if (vo.getId().equals(checkaccount.getId()) && vo.getPassword().equals(checkaccount.getPassword())) {
				mv.setViewName("login/login_check");
				mv.addObject("vo", checkaccount);
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

	@RequestMapping(value = "/login")
	public String login2() {
		return "login/login";
	}

	@RequestMapping(value = "/register")
	public String register() {
		return "login/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView insertAccount(LoginVo vo) {

		ModelAndView mv = new ModelAndView();
		if(vo.getId() != "")
		{
			if (vo.getPassword().equals(vo.getPassword_check())) {
				LoginVo checkaccount = lService.SearchAccount(vo.getId());
				
				if (checkaccount != null && vo.getId() != "") {
					mv.setViewName("login/duplication");
					return mv;
				}
				lService.SaveAccount(vo);
				mv.setViewName("login/login");
				return mv;
			} else {
				mv.setViewName("login/incorrect");
				return mv;
			}
		}
		mv.setViewName("login/register");
		return mv;
	}

	//========================main================================//
		
	
		//=======================android============================//
		/*
		@RequestMapping(value = "/main/android/request_recent_log", method = RequestMethod.GET)
		public ModelAndView android_recent_log(@RequestParam(value = "id" , required=false, defaultValue="1") String id ){
			
			SpeedVo sv = sService.SearchSpeed(id);
			ModelAndView mv = new ModelAndView();
			mv.addObject("sv", sv);
			mv.setViewName("main/android/request_recent_log");
			return mv;
		}
		*/
		//=========================================================//
		
		//=======================web===============================//
		
		@RequestMapping(value = "/home")
		public String home() {
			return "main/web/home";
		}
		
		@RequestMapping(value = "/home", method = RequestMethod.POST)
		public ModelAndView home(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			MainVo member = mService.SearchCount();
			
			List<MainVo> LMV = mService.selectAllList(vo.getId());
			int size = LMV.size();
			
			if(LMV.toString().equals("[null]") || size == 0)
			{
				mv.addObject("mainvo", member);	
			}
			else
			{
				MainVo mainvo = LMV.get(size-1);
				mainvo.setCount(size);
				mainvo.setMember(member.getMember());
				mv.addObject("mainvo", mainvo);
			}
			mv.setViewName("main/web/home");
			return mv;
			
		}
		
		@RequestMapping(value = "/rank", method = RequestMethod.POST)
		public ModelAndView rank(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/rank");
			return mv;
			
		}
		
		@RequestMapping(value = "/community", method = RequestMethod.POST)
		public ModelAndView community(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/community");
			return mv;
			
		}
		@RequestMapping(value = "/profile", method = RequestMethod.POST)
		public ModelAndView profile(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/profile");
			return mv;
			
		}
		@RequestMapping(value = "/device", method = RequestMethod.POST)
		public ModelAndView device(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/device");
			return mv;
			
		}
		//=========================================================//

		
		//=======================log================================//

		@RequestMapping(value = "/recent_free", method = RequestMethod.POST)
		public ModelAndView recent_f(LoginVo vo) {
			ModelAndView mv = new ModelAndView();
			SpeedVo sv = sService.SearchSpeed_f(vo.getId());
			mv.addObject("sv", sv);
			mv.setViewName("main/log/recent_free");
			return mv;
		}
		
		@RequestMapping(value = "/recent_pendulum", method = RequestMethod.POST)
		public ModelAndView recent_p(LoginVo vo) {
			ModelAndView mv = new ModelAndView();
			SpeedVo sv = sService.SearchSpeed_p(vo.getId());
			mv.addObject("sv", sv);
			mv.setViewName("main/log/recent_pendulum");
			return mv;
		}
		
		@RequestMapping(value = "/recent_turn", method = RequestMethod.POST)
		public ModelAndView recent_t(LoginVo vo) {
			ModelAndView mv = new ModelAndView();
			SpeedVo sv = sService.SearchSpeed_t(vo.getId());
			mv.addObject("sv", sv);
			mv.setViewName("main/log/recent_turn");
			return mv;
		}
		
		@RequestMapping(value = "/recent_record", method = RequestMethod.POST)
		public ModelAndView recent_r(LoginVo vo) {
			ModelAndView mv = new ModelAndView();
			SpeedVo sv = sService.SearchSpeed_r(vo.getId());
			mv.addObject("sv", sv);
			mv.setViewName("main/log/recent_record");
			return mv;
		}
		
		@RequestMapping(value = "/all", method = RequestMethod.POST)
		public ModelAndView all(LoginVo vo) {
			ModelAndView mv = new ModelAndView();
			List<SpeedVo> LSV = sService.searchAllSpeed(vo.getId());
			mv.addObject("lsv", LSV);
			mv.setViewName("main/log/all");
			return mv;
		}
		
		@RequestMapping(value = "/all", method = RequestMethod.GET)
		public ModelAndView all_select(@RequestParam(value = "num") int num) {
			
			ModelAndView mv = new ModelAndView();
			SpeedVo osv = sService.selectOneAllSpeed(num);
			List<SpeedVo> LSV = sService.selectAllSpeed(osv.getMacaddress());
			mv.addObject("osv", osv);
			mv.addObject("lsv", LSV);
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
		public String receivedata(@RequestParam(value = "mode", required = false, defaultValue = "1") String mode,
				@RequestParam(value = "max_v", required = false, defaultValue = "2") int max_v,
				@RequestParam(value = "average_v", required = false, defaultValue = "3") int average_v,
				@RequestParam(value = "distance", required = false, defaultValue = "4") int distance,
				@RequestParam(value = "time", required = false, defaultValue = "5") int time,
				@RequestParam(value = "count", required = false, defaultValue = "6") String count,
				@RequestParam(value = "falldown", required = false, defaultValue = "7") String falldown,
				@RequestParam(value = "speed", required = false, defaultValue = "8") String speed,
				@RequestParam(value = "gyro", required = false, defaultValue = "9") String gyro,
				@RequestParam(value = "beacon", required = false, defaultValue = "10") String beacon,
				@RequestParam(value = "location", required = false, defaultValue = "11") String location,
				@RequestParam(value = "macaddress", required = false, defaultValue = "12") String macaddress){
			
			Date d = new Date();
			String date = d.toString();
			String score = "4";
			
			SpeedVo vo = new SpeedVo();
			vo.setMode(mode);
			vo.setMax_v(max_v);
			vo.setAverage_v(average_v);
			vo.setDistance(distance);
			vo.setTime(time);
			vo.setScore(score);
			vo.setCount(count);
			vo.setFalldown(falldown);
			vo.setSpeed(speed);
			vo.setGyro(gyro);
			vo.setBeacon(beacon);
			if(location.equals("thirts"))
			{
				vo.setLocation("THIRTS 리조트");
			}
			vo.setMacaddress(macaddress);
			vo.setDate(date);
			sService.SaveSpeed(vo);
			return "db/receivedata";
		}
		
		//=============================================================//
		
		//=====================bootstrap test==============================//
		@RequestMapping(value = "/blank")
		public String blank() {
			return "bootstrap/blank";
		}
		@RequestMapping(value = "/buttons")
		public String buttons() {
			return "bootstrap/buttons";
		}
		@RequestMapping(value = "/flot")
		public String flot() {
			return "bootstrap/flot";
		}
		@RequestMapping(value = "/forms")
		public String forms() {
			return "bootstrap/forms";
		}
		@RequestMapping(value = "/grid")
		public String grid() {
			return "bootstrap/grid";
		}
		@RequestMapping(value = "/icons")
		public String icons() {
			return "bootstrap/icons";
		}
		@RequestMapping(value = "/index")
		public String index() {
			return "bootstrap/index";
		}
		/*
		@RequestMapping(value = "/login")
		public String login() {
			return "bootstrap/login";
		}
		*/
		@RequestMapping(value = "/morris")
		public String morris() {
			return "bootstrap/morris";
		}
		@RequestMapping(value = "/notifications")
		public String notifications() {
			return "bootstrap/notifications";
		}
		@RequestMapping(value = "/panels-wells")
		public String wells() {
			return "bootstrap/panels-wells";
		}
		@RequestMapping(value = "/tables")
		public String tables() {
			return "bootstrap/tables";
		}
		@RequestMapping(value = "/typography")
		public String typography() {
			return "bootstrap/typography";
		}
		//=============================================================//
}