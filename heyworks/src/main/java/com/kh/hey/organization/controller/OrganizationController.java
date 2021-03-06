package com.kh.hey.organization.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;
import com.kh.hey.organization.model.service.OrganizationService;
import com.kh.hey.organization.model.vo.Organ;

@Controller
public class OrganizationController {
	
	@Autowired
	private OrganizationService orService;
	
	
	// 전체 조직도 요청
	@RequestMapping("list.organ")
	public String selectOrgan(Model model, HttpSession session) {
		
		// 부서 코드 알아오기
		ArrayList<Organ> dept = orService.selectDept();
		ArrayList<Organ> organ = orService.selectOrgan();
		
		if(organ != null) {
			session.setAttribute("dept", dept);
			model.addAttribute("organ", organ);
			return "organization/organizationMain";
		}else {
			System.out.println("요청실패");
			return "redirect:/";
		}
		
	}
	
	// 조직도 부서별 요청
	@RequestMapping("detail.organ")
	public ModelAndView DeptOrgan(int dno, ModelAndView mv) {
		
		ArrayList<Organ> organ = orService.deptOrgan(dno);
		Organ dt = orService.selectDeptName(dno);
		
		if(organ != null) {
			mv.addObject("organ", organ)
			  .addObject("dt", dt)
			  .setViewName("organization/organizationSub");
			return mv;
		}else {
			System.out.println("요청실패");
			mv.setViewName("redirect:/");
			return mv;
		}
		
	}
	
	// 임직원 검색
	@RequestMapping("search.organ")
	public String selectEmployee(String userName, Model model) {
		
		ArrayList<Organ> organ = orService.selectEmployee(userName);
		
		if(organ != null) {
			model.addAttribute("organ", organ);
			return "organization/organizationMain";
			
		}else {
			//System.out.println("요청실패");
			return "redirect:/";
		}
		
	}
	
	// 임직원 상세보기
	@ResponseBody
	@RequestMapping("detail.emp")
	public Organ detailEmployee(int userNo) {
		
		Organ emp = orService.detailEmployee(userNo);
		
		if(emp != null) {
			return emp;		
		}else {
			//System.out.println("요청실패");
			return emp;
		}
	}
	
	
	// ---------------- 관리자모드 ---------------------
	
	// 임직원 조회
	@RequestMapping("list.adminOrgan")
	public String adSelectOrgan(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
								@RequestParam(value="dno", defaultValue="0") int dno,
								@RequestParam(value="userName", defaultValue="")String userName, HttpSession session, Model model) {
		
		// 갯수조회
		if(userName.equals("")) {			
		
			int listCount = orService.adCountList(dno);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Organ> organ = orService.adminDeptOrgan(dno, pi);
			if(organ != null) {
				model.addAttribute("organ", organ);
				model.addAttribute("pi", pi);
				model.addAttribute("dno", dno);
				return "organization/adminUserSetMain";
			}else {
				return "organization/adminUserSetMain";
			}
			
		}else {
			int listCount = orService.adSearchCountList(userName);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Organ> organ = orService.adSearchOrgan(userName, pi);
			if(organ != null) {
				model.addAttribute("organ", organ);
				model.addAttribute("pi", pi);
				model.addAttribute("userName", userName);
				return "organization/adminUserSetMain";
			}else {
				session.setAttribute("alertMsg", "잘못된 요청입니다.");
				return "organization/adminUserSetMain";
			}
		}
		
		
		// 조직도 조회요청
		
		
		
		
	}
	
	// 사용자추가 폼
	@RequestMapping("userPlustForm.organ")
	public String userPlusForm() {
		return "organization/adminUserPlusForm";
	}
	
	// 사용자추가 요청
	@RequestMapping("insert.organ")
	public String insertOrgan(Organ o, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().contentEquals("")) {
			
			String changeName = saveFile(upfile, session);
			o.setImage("resources/uploadFiles/employeeImg/" + changeName);
			
		}
		
		int result = orService.insertOrgan(o);
		
		if(result > 0) {
			System.out.println("성공");
		}
		return "redirect:list.adminOrgan";
		
	}
	
	// 사용자추가 > ID 유효성검사
	@ResponseBody
	@RequestMapping("idCheck.organ")
	public String checkId(String id) {
		int count = orService.checkId(id);
		return count > 0 ? "NN" : "NY";
	}
	
	// 사용자추가 > 사번 유효성검사
	@ResponseBody
	@RequestMapping("noCheck.organ")
	public String checkNo(int no) {
		int count = orService.checkNo(no);
		return count > 0 ? "NN" : "NY";
	}
	
	// 임직원 정보수정폼
	@RequestMapping("updateForm.organ")
	public String updateForm(int userNo, Model model) {
		
		Organ o  = orService.detailEmployee(userNo);
		if(o != null) {
			model.addAttribute("o", o);
			return "organization/adminUserUpdateForm";
		}else {
			System.out.println("상세정보 불러오기 실패");
			return "organization/adminUserUpdateForm";
		}
	}
	
	// 임직원 정보수정요청
	@RequestMapping("update.organ")
	public String updateOrgan(Organ o, HttpSession session) {
		int result = orService.updateOrgan(o);
		
		if(result>0) {
			session.setAttribute("alertMsg", "정보가 수정되었습니다.");
			return "redirect:list.adminOrgan";
		}else {
			session.setAttribute("alertMsg", "정보 수정에 실패했습니다.");
			return "redirect:list.adminOrgan";
		}
	}
	
	
	// 첨부파일용 메소드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 900 + 100);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/employeeImg/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}

}
