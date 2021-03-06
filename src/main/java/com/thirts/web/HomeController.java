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
import com.thirts.pi.PiService;
import com.thirts.pi.PiVo;
import com.thirts.rank.RankService;
import com.thirts.rank.RankVo;
import com.thirts.sha.SHA_ENC;

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
	
	@Autowired
	@Qualifier("piService")
	PiService pService;
	
	@Autowired
	@Qualifier("rankService")
	RankService rService;

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
		SHA_ENC enc = new SHA_ENC();
		LoginVo checkaccount = lService.SearchAccount(enc.SHA256_Encrypt(vo.getId()));

		if (checkaccount != null && vo.getId() != "") {
			if (enc.SHA256_Encrypt(vo.getId()).equals(checkaccount.getId()) && enc.SHA256_Encrypt(vo.getPassword()).equals(checkaccount.getPassword())) {
				mv.setViewName("login/login_check");
				mv.addObject("vo", checkaccount);
				return mv;
			} else {
				mv.setViewName("login/incorrect");
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
		SHA_ENC enc = new SHA_ENC();
		
		if(vo.getId() != "")
		{
			if (vo.getPassword().equals(vo.getPassword_check())) {
				LoginVo checkaccount = lService.SearchAccount(enc.SHA256_Encrypt(vo.getId()));
				
				if (checkaccount != null && vo.getId() != "") {
					mv.setViewName("login/duplication");
					return mv;
				}
				vo.setId(enc.SHA256_Encrypt(vo.getId()));
				vo.setPassword(enc.SHA256_Encrypt(vo.getPassword()));
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
		@RequestMapping(value = "/m_home", method = RequestMethod.GET)
		public ModelAndView m_home() {
		
			ModelAndView mv = new ModelAndView();

			mv.setViewName("main/android/m_home");
			return mv;
			
		}
		@RequestMapping(value = "/m_recent", method = RequestMethod.GET)
		public ModelAndView m_recent (@RequestParam(value = "id") String id) {
			ModelAndView mv = new ModelAndView();
			SpeedVo sv = sService.SearchSpeed(id);
			mv.addObject("sv", sv);
			mv.setViewName("main/android/m_recent");
			
			return mv;
		}
		@RequestMapping(value = "/m_all", method = RequestMethod.GET)
		public ModelAndView m_all(LoginVo vo) {
			ModelAndView mv = new ModelAndView();
			List<SpeedVo> LSV = sService.searchAllSpeed(vo.getId());
			mv.addObject("lsv", LSV);
			mv.setViewName("main/android/m_all");
			return mv;
		}
		@RequestMapping(value = "/m_tracking", method = RequestMethod.GET)
		public ModelAndView m_tracking(Model model) {
			ModelAndView mv = new ModelAndView();
			List<PiVo> LPV = pService.selectAllBeacon();
			mv.addObject("lpv", LPV);
			mv.setViewName("main/android/m_tracking");
			return mv;
		}
		
		
		@RequestMapping(value = "/m_rank", method = RequestMethod.GET)
		public ModelAndView m_rank(@RequestParam(value = "location") String location,@RequestParam(value = "type", required = false, defaultValue = "max") String type) {
			ModelAndView mv = new ModelAndView();
			List<RankVo> LRVM = rService.searchRank_m("THIRTS 리조트");
			List<RankVo> LRVA = rService.searchRank_a("THIRTS 리조트");
			List<RankVo> LRVS = rService.searchRank_s("THIRTS 리조트");
			mv.addObject("lrvm",LRVM);
			mv.addObject("lrva",LRVA);
			mv.addObject("lrvs",LRVS);
			mv.setViewName("main/android/m_rank");
			return mv;
			
		}
		@RequestMapping(value = "/m_community", method = RequestMethod.GET)
		public ModelAndView m_community(Model model) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("main/android/m_community");
			return mv;
		}
		@RequestMapping(value = "/m_device", method = RequestMethod.POST)
		public ModelAndView m_device(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();

			lService.SaveDevice(vo);
			mv.addObject("vo", vo);
			mv.setViewName("main/android/m_device");
			return mv;
		}
		
		@RequestMapping(value = "/m_device", method = RequestMethod.GET)
		public ModelAndView get_m_device(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			mv.addObject("vo", vo);

			mv.setViewName("main/android/m_device");
			return mv;
			
		}
		
		@RequestMapping(value = "/m_login")
		public String m_login() {
			return "main/android/m_login";
		}
		
		@RequestMapping(value = "/m_login_check", method = RequestMethod.POST)
		public ModelAndView m_selectId(LoginVo vo) {
			
			ModelAndView mv = new ModelAndView();
			SHA_ENC enc = new SHA_ENC();
			
			LoginVo checkaccount = lService.SearchAccount(enc.SHA256_Encrypt(vo.getId()));

			if (checkaccount != null && vo.getId() != "") {
				if (enc.SHA256_Encrypt(vo.getId()).equals(checkaccount.getId()) && enc.SHA256_Encrypt(vo.getPassword()).equals(checkaccount.getPassword())) {
					mv.setViewName("main/android/m_login_check");
					mv.addObject("vo", checkaccount);
					return mv;
				} else {
					mv.setViewName("login/incorrect");
					return mv;
				}
			} else {
				mv.setViewName("login/loginFail");
				return mv;
			}
		}
		
		@RequestMapping(value = "/m_register")
		public String m_register() {
			return "main/android/m_register";
		}
		@RequestMapping(value = "/m_register", method = RequestMethod.POST)
		public ModelAndView m_insertAccount(LoginVo vo) {

			ModelAndView mv = new ModelAndView();
			SHA_ENC enc = new SHA_ENC();
			if(vo.getId() != "")
			{
				if (vo.getPassword().equals(vo.getPassword_check())) {
					LoginVo checkaccount = lService.SearchAccount(vo.getId());
					
					if (checkaccount != null && vo.getId() != "") {
						mv.setViewName("login/duplication");
						return mv;
					}
					vo.setId(enc.SHA256_Encrypt(vo.getId()));
					vo.setPassword(enc.SHA256_Encrypt(vo.getPassword()));
					lService.SaveAccount(vo);
					mv.setViewName("main/android/m_login");
					return mv;
				} else {
					mv.setViewName("login/incorrect");
					return mv;
				}
			}
			mv.setViewName("main/android/m_register");
			return mv;
		}
		
		//=========================================================//
		
		
		//=======================web===============================//
		
		@RequestMapping(value = "/home")
		public String home() {
			return "main/web/home";
		}
		
		@RequestMapping(value = "/home", method = RequestMethod.POST)
		public ModelAndView home(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			
			mv.setViewName("main/web/home");
			return mv;
			
		}
		
		@RequestMapping(value = "/rank", method = RequestMethod.POST)
		public ModelAndView rank(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/rank");
			return mv;
		}
		
		@RequestMapping(value = "/rank", method = RequestMethod.GET)
		public ModelAndView rank_get(@RequestParam(value = "location") String location,@RequestParam(value = "type", required = false, defaultValue = "max") String type) {
			ModelAndView mv = new ModelAndView();
			List<RankVo> LRVM = rService.searchRank_m("THIRTS 리조트");
			List<RankVo> LRVA = rService.searchRank_a("THIRTS 리조트");
			List<RankVo> LRVS = rService.searchRank_s("THIRTS 리조트");
			mv.addObject("lrvm",LRVM);
			mv.addObject("lrva",LRVA);
			mv.addObject("lrvs",LRVS);
			mv.setViewName("main/web/rank");
			return mv;
			
		}
		
		@RequestMapping(value = "/community", method = RequestMethod.POST)
		public ModelAndView community(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/community");
			return mv;
			
		}
		
		@RequestMapping(value = "/ski", method = RequestMethod.POST)
		public ModelAndView ski(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/ski");
			return mv;
			
		}
		
		@RequestMapping(value = "/board", method = RequestMethod.POST)
		public ModelAndView board(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/board");
			return mv;
			
		}
		
		@RequestMapping(value = "/profile", method = RequestMethod.POST)
		public ModelAndView profile(LoginVo vo) {

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
				
				List<RankVo> LRV = rService.searchRank_s("THIRTS 리조트");
				mv.addObject("lrv", LRV);
			}
			

			mv.setViewName("main/web/profile");
			return mv;
			
		}
		@RequestMapping(value = "/device", method = RequestMethod.GET)
		public ModelAndView device() {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/web/device");
			return mv;
			
		}
		
		@RequestMapping(value = "/device", method = RequestMethod.POST)
		public ModelAndView device(LoginVo vo) {
		
			ModelAndView mv = new ModelAndView();

			lService.SaveDevice(vo);
			mv.addObject("vo", vo);

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
			List<PiVo> LPV = pService.selectAllBeacon();
			mv.addObject("lpv", LPV);
			mv.addObject("sv", sv);
			mv.setViewName("main/log/recent_pendulum");
			return mv;
		}
		
		@RequestMapping(value = "/recent_turn", method = RequestMethod.POST)
		public ModelAndView recent_t(LoginVo vo) {
			ModelAndView mv = new ModelAndView();
			SpeedVo sv = sService.SearchSpeed_t(vo.getId());
			List<PiVo> LPV = pService.selectAllBeacon();
			mv.addObject("lpv", LPV);
			mv.addObject("sv", sv);
			mv.setViewName("main/log/recent_turn");
			return mv;
		}
		
		@RequestMapping(value = "/recent_record", method = RequestMethod.POST)
		public ModelAndView recent_r(LoginVo vo) {
			ModelAndView mv = new ModelAndView();
			SpeedVo sv = sService.SearchSpeed_r(vo.getId());
			if(sv != null)
			{
				List<RankVo> LRV = rService.searchRank_s(sv.getLocation());
				mv.addObject("lrv", LRV);
			}
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
			System.out.println(osv.getMacaddress());
			List<SpeedVo> LSV = sService.selectAllSpeed(osv.getMacaddress());
			mv.addObject("osv", osv);
			mv.addObject("lsv", LSV);
			mv.setViewName("main/log/all");
			return mv;
		}
		
		@RequestMapping(value = "/tracking", method = RequestMethod.GET)
		public ModelAndView tracking(Model model) {
			ModelAndView mv = new ModelAndView();
			List<PiVo> LPV = pService.selectAllBeacon();
			mv.addObject("lpv", LPV);
			mv.setViewName("main/log/tracking");
			return mv;
		}
		@RequestMapping(value = "/tracking2", method = RequestMethod.GET)
		public ModelAndView tracking2(Model model) {
			ModelAndView mv = new ModelAndView();
			List<PiVo> LPV = pService.selectAllBeacon();
			mv.addObject("lpv", LPV);
			mv.setViewName("main/log/tracking2");
			return mv;
		}
		
		@RequestMapping(value = "/geo", method = RequestMethod.GET)
		public ModelAndView geo() {
		
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("main/log/geo");
			return mv;
			
		}
		//==========================================================//
	
		//========================db=================================//
		public static String CalibrationScore(String mode, int max_v, int distance, int time, String gyro, int count)
		{
			System.out.println("Free mode Score test");
			double score=0;
			if(time >=10)
			{
				if(max_v>=10)
				{
					score += 30;
				}
				else if(max_v>=20)
				{
					score += 20;
				}
				else if(max_v>=10)
				{
					score += 10;
				}
				
				// E_percent //
				String[] tmp = gyro.split(",");
				   int E_percent=0;
				   for(int i=0; i<tmp.length; i++)
				   {
				   	if(tmp[i].equals("E") || tmp[i].equals("B"))
				   	{
				   		E_percent++;	
				   	}
				   }
				 E_percent = E_percent*100/(tmp.length-1);
			   if(E_percent >= 80)
			    {
			    	score += 100;
			    }
			    else if(E_percent >= 60)
			    {
			    	score += 80;
			    }
			    else if(E_percent >= 40)
			    {
			    	score += 60;
			    }
			    else 
			    	score += 40;
			    
			    score -= count*10;
			    if(score>100)
			    {
			    	return "5";
			    }
			    else
			    {
			    	return String.valueOf(score/20);
			    }
			}
			else
			{
				return "X";
			}
		}
		
		
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
			
			SpeedVo vo = new SpeedVo();
			vo.setMode(mode);
			vo.setMax_v(max_v);
			vo.setAverage_v(average_v);
			vo.setDistance(distance);
			vo.setTime(time);
			if(mode == "F" || mode == "R")
			{
				String cal_score = CalibrationScore(mode,max_v,distance,time,gyro,Integer.parseInt(count));
				vo.setScore(cal_score);
			}
			else
			{
				vo.setScore("X");
			}
			vo.setCount(count);
			vo.setFalldown(falldown);
			vo.setSpeed(speed);
			vo.setGyro(gyro);
			vo.setBeacon(beacon);
			if(location.equals("thirts"))
			{
				vo.setLocation("THIRTS 슬로프");
			}
			vo.setMacaddress(macaddress);
			vo.setDate(date);
			sService.SaveSpeed(vo);
			return "db/receivedata";
		}
		
		@RequestMapping(value = "/db/ble_test", method = RequestMethod.GET)
		public String receivedata(@RequestParam(value = "beacon1", required = false, defaultValue = "1") String beacon1,
				@RequestParam(value = "beacon2", required = false, defaultValue = "2") String beacon2,
				@RequestParam(value = "beacon3", required = false, defaultValue = "3") String beacon3,
				@RequestParam(value = "axis", required = false, defaultValue = "4") String axis){
			
			PiVo vo = new PiVo();
			vo.setBeacon1(beacon1);
			vo.setBeacon2(beacon2);
			vo.setBeacon3(beacon3);
			vo.setAxis(axis);
			
			pService.SaveBeacon(vo);
			return "db/ble_test";
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