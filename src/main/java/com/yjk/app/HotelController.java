package com.yjk.app;

import java.lang.ProcessBuilder.Redirect;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@Controller
public class HotelController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private HttpSession session;
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/home")
	public String dohotel() {
		return "home";
	}
	@RequestMapping(value= "/check_user",method=RequestMethod.POST)
	public String check_user(HttpServletRequest hsr,Model model) {
		System.out.println(hsr.getParameter("userid"));
		System.out.println(hsr.getParameter("passcode"));
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		//DB에서 유저확인 : 기존우저면 booking, 없으면 home 으로
		iMember member=sqlSession.getMapper(iMember.class);
		int n=member.doCheckUser(userid,passcode);
		if(n>0) {
			HttpSession session=hsr.getSession();
			session.setAttribute("loginid", userid);
		return "redirect:/booking"; //RequestMapping의 경로 이름
	} else {
		return "home"; 
		}
	}
	@RequestMapping(value= "/booking",method=RequestMethod.GET)
		public String doOK(HttpServletRequest hsr,Model model) {
			String uid=hsr.getParameter("userid");
			String upw=hsr.getParameter("userpw");
			model.addAttribute("loginid",uid);
			model.addAttribute("region",upw);
		return "booking"; // JSP화일 이름
	}
	@RequestMapping("/room")
	public String doroom(HttpServletRequest hsr,Model model) {
		HttpSession session=hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/home";
		}
		iRoom room=sqlSession.getMapper(iRoom.class);
		
		// 여기서 interface호출하고 결과를 room.jsp에 전달
		/*
		 * ArrayList<Roominfo> roominfo=room.getRoomList();
		 * model.addAttribute("list",roominfo);
		 */
		ArrayList<RoomShow> roomtShow=room.getRoomShow();
		model.addAttribute("type",roomtShow);
		return "room";
	}
	@RequestMapping("/login")
	public String dologin() {
		return "home";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
	HttpSession session=hsr.getSession();
	session.invalidate();
	return "redirect:/home";
	}
	 @RequestMapping(value="/signin",method=RequestMethod.POST,
	         produces="application/text; charset=utf8")
	   public String doSignin(HttpServletRequest hsr) {
	   System.out.println(hsr.getParameter("realname"));
	   System.out.println(hsr.getParameter("userid"));
	   System.out.println(hsr.getParameter("passcode"));
	   
	      String realname=hsr.getParameter("realname");
	      String userid=hsr.getParameter("userid");
	      String passcode=hsr.getParameter("passcode1");
	      iMember member=sqlSession.getMapper(iMember.class);
	      member.doSignin(realname,userid,passcode);
	      return "home";
	   }
	@RequestMapping(value="/getRoomList",method=RequestMethod.POST,
					produces = "application/text; charset=utf8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo=room.getRoomList();
		//찾아진 데이터로 jsonArray만들기
		JSONArray ja = new JSONArray();
		for(int i=0;i<roominfo.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping("/app/home")
	public String donView(HttpServletRequest hsr,Model model) {
		String uid=hsr.getParameter("userid");
		String upw=hsr.getParameter("passcode");
		String uName=hsr.getParameter("name");
		model.addAttribute("nid",uid);
		model.addAttribute("npw",upw);
		model.addAttribute("nname", uName);
		return "redirect:/home";
	}
	@RequestMapping("/selected")
	public String dohotel(HttpServletRequest hsr,Model model) {
		String str=hsr.getParameter("path");
		if(str.equals("app")) {
			return "home";
		}else if(str.equals("newbie")) {
			return "newbie";
		}else {
			return "home";
		}
	}
	@RequestMapping(value="/deleteRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	@RequestMapping(value="/addRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
//		System.out.println(hsr.getParameter("roomtype"));
//		System.out.println(hsr.getParameter("howmany"));
//		System.out.println(hsr.getParameter("howmuch"));
//		System.out.println(hsr.getParameter("roomname"));
		String rname = hsr.getParameter("roomname");
		int rtype = Integer.parseInt(hsr.getParameter("roomtype"));
		//System.out.println("rtype ["+rtype+"]");
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doaddRoom(rname, rtype, howmany, howmuch);
		return "ok";
		}
		@RequestMapping(value="/updateRoom",method=RequestMethod.POST,
				produces = "application/text; charset=utf8")
		@ResponseBody
		public String updateRoom(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(Integer.parseInt(hsr.getParameter("roomcode")),
				hsr.getParameter("roomname"),
				Integer.parseInt(hsr.getParameter("roomtype")),
				Integer.parseInt(hsr.getParameter("howmany")),
				Integer.parseInt(hsr.getParameter("howmuch")));
		return "ok";
	}
}
