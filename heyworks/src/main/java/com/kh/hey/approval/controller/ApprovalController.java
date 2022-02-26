package com.kh.hey.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import com.kh.hey.approval.model.service.ApprovalService;
import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.service.ReplyService;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;
import com.kh.hey.employee.model.service.EmployeeService;
import com.kh.hey.employee.model.vo.Employee;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@Autowired
	private EmployeeService eService;

	@RequestMapping("main.el")
	public String mainList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model, HttpSession session) {
		
		// 결재--------------------------
		String userName = ((Employee)session.getAttribute("loginUser")).getUserName();
		
		int listCount = aService.selectListCount(userName);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> apList = aService.selectStandByList(pi, userName);
		
		// 참조 열람------------------------
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		ArrayList<Approval> rrList = aService.selectReadReference(pi, userNo);
		
		// 완료---------------------------
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("status", "Y");

		ArrayList<Approval> edList = aService.selectSubmitEndList(pi, map);
		
		model.addAttribute("apList", apList); // 결재자 목록
		model.addAttribute("rrList", rrList);
		model.addAttribute("edList", edList);

		return "approval/approvalMainList";
		
	}
	
	/*작성하기 페이지*/
	@RequestMapping("approvalFrom.el")
	public ModelAndView approvalFrom(ModelAndView mv) {
		
		ArrayList<Employee> deptList = eService.selectDeptList();
		mv.addObject("deptList", deptList);
		mv.setViewName("approval/approvalEnrollFrom");
		
		return mv;
		
	} // 증명서, 채용, 일반품의서
	
	@RequestMapping("bdEnrollForm.el")
	public String businessDraftEnrollForm() {
		
		return "approval/businessDraftEnrollForm";
		
	} // 업무기안서
	
	@RequestMapping("ebEnrollForm.el")
	public ModelAndView eqBuyEnrollForm(ModelAndView mv) {
		
		ArrayList<Employee> deptList = eService.selectDeptList();
		mv.addObject("deptList", deptList);
		mv.setViewName("approval/eqBuyEnrollForm");
		
		return mv;
		
	} // 비품신청서
	
	// 전자결재 사원목록조회
	@ResponseBody
	@RequestMapping(value="emplist.el", produces="application/json; charset=UTF-8")
	public String ajaxSelectEmployeeList(int dnum, int jnum) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("deptNum", dnum);
		map.put("jobNum", jnum);
		
		ArrayList<Employee> list = eService.ajaxSelectEmployeeList(map);
		
		return new Gson().toJson(list);
	}
	
	/*결재자 기준 결재 대기 목록 페이지*/	
	@RequestMapping("standby.el")
	public ModelAndView selectStandByList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv, HttpSession session) {
		
		// 조건검사할 로그인 객체 받아오기
		String userName = ((Employee)session.getAttribute("loginUser")).getUserName();

		
		int listCount = aService.selectListCount(userName);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> apList = aService.selectStandByList(pi, userName);
		
		mv.addObject("pi", pi);
		mv.addObject("apList", apList);
		
		mv.setViewName("approval/standbyList");

		return mv;
		
	} // 각 게시판 페이징처리해서 조회
	
	// 기안자 기준 전체, 결재대기, 진행중목록
	@RequestMapping("onlist.el")
	public String selectSubmitStandbyList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String status, Model model, HttpSession session) {
		
		// 조건검사할 로그인 객체 받아오기
		String userName = ((Employee)session.getAttribute("loginUser")).getUserName();
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userName", userName);
		map.put("userNo", userNo);
		map.put("status", status);
		
		
		int listCount = aService.selectSubmitListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> sbList = aService.selectSubmitStandByList(pi, map);
		
		model.addAttribute("status", status);
		model.addAttribute("pi", pi);
		model.addAttribute("sbList", sbList);
		
		return "approval/submitStandbyList";
		
	}
	
	// 기안자 기준 승인, 반려, 임시저장목록
	@RequestMapping("endlist.el")
	public String selectEndList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String status, Model model, HttpSession session, String keyword, String subject, String type) {
		
		// 조건검사할 로그인 객체 받아오기
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("status", status);
		map.put("keyword", keyword);
		map.put("subject", subject);
		map.put("type", type);
		
		
		int listCount = aService.selectSubmitListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> edList = aService.selectSubmitEndList(pi, map);
		
		model.addAttribute("status", status);
		model.addAttribute("keyword", keyword);
		model.addAttribute("subject", subject);
		model.addAttribute("type", type);
		model.addAttribute("pi", pi);
		model.addAttribute("edList", edList);
		
		return "approval/submitEndList";
	}
	
	// 결재자 기준 참조/열람대기문서
	@RequestMapping("readNref.el")
	public String selectReadReference(@RequestParam(value="cpage", defaultValue="1")int currentPage, String status, Model model, HttpSession session) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		int listCount = aService.selectReadNrefListCount(userNo);
		
		PageInfo rrpi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> rrList = aService.selectReadReference(rrpi, userNo);
		
		model.addAttribute("rrpi", rrpi);
		model.addAttribute("rrList", rrList);
		
		return "approval/readOrReferenceList";
		
	}
	
	// 열람 참조시 Y로 변경
	@ResponseBody
	@RequestMapping("check.el")
	public String updateReadReference(String approvalNo, String userNo, String read, String reference, String userName, HttpSession session) {
		
		int result = 0;
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("approvalNo", approvalNo);
		map.put("userNo", userNo);

		if(read.equals(userName)) {
			
			map.put("status", "read");
			result = aService.updateReadReference(map);
			
		}else if(reference.equals(userName)){
			
			map.put("status", "reference");
			result = aService.updateReadReference(map);
		}

		return result>0 ? "S" : "F";
	}
	
	// 상세보기
	@RequestMapping("detail.el")
	public ModelAndView selectApproval(String ano, HttpSession session, ModelAndView mv) {
		
		String formNo = ano.substring(3,5); // 양식 조건비교할 값 담기
		
		Approval ap = aService.selectApproval(ano); // 제목~결재자까지 알아오기

		if(ap != null) {
			
			mv.addObject("ap", ap);	
			
			if(formNo.equals("BD")) { // 업무기안서 상세
				
				Approval bd = aService.selectBusinessDraft(ano);
				mv.addObject("bd", bd);
				
			}else if(formNo.equals("EB")) { // 비품구매 상세
				
				Approval eb = aService.selectEquipmentBuy(ano);
				mv.addObject("eb", eb);
				
			}else if(formNo.equals("CE")) { // 증명서 신청 상세
				
				Approval ce = aService.selectCertificate(ano);
				mv.addObject("ce", ce);
				
			}else if(formNo.equals("RC")) { // 채용요청서 상세
				
				Approval rc = aService.selectRecruiment(ano);
				mv.addObject("rc", rc);
				
			}else { // 일반품의서 상세
				
				Approval er = aService.selectExpenseReport(ano);
				mv.addObject("er", er);
				
			}
			mv.setViewName("approval/approvalDetail");
			
			
		}else {
			//mv.addObject("errorMsg", "게시글 상세조회 실패!");
			//mv.setViewName("redirect:/standby.el");
		}
		
		return mv;
	}
	
	/* 작성하기 */
	@RequestMapping("insert.el")
	public String insertApproval(Approval ap, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<Approval> confirmList = ap.getConfirmList();
		ArrayList<Approval> itemList = ap.getItemList();
		
		// 첨부파일 여부 확인하기
		if(!upfile.getOriginalFilename().contentEquals("")) {
			
			String changeName = saveFile(upfile, session);
			
			ap.setOriginName(upfile.getOriginalFilename());
			ap.setFilePath("resources/uploadFiles/approval/" + changeName);
			
		}
		
		// 전자결재 공통컬럼
		int result = aService.insertApproval(ap);
		
		if(result > 0) {
		
			if(ap.getFormNo().equals("3")) {
				
				// 전자결재 결재자
				//ap.setFormNoName("SA-CE-");
				
				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setFormNoName("SA-CE-");
				}
				
				// 증명서 신청
				int ceResult = aService.insertCertificate(ap);
				
				
				if(ceResult > 0) {
					session.setAttribute("alertMsg", "증명서신청 문서 작성에 성공했습니다.");
				}else {
					session.setAttribute("alertMsg", "증명서신청 문서 작성에 실패했습니다!");
				}
				
				
			}else if(ap.getFormNo().equals("4")) {
				

				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setFormNoName("SA-RC-");
				}
				
				// 채용요청서 신청
				int rcResult = aService.insertRecruiment(ap);
				
				
				if(rcResult > 0) {
					session.setAttribute("alertMsg", "채용요청서 문서 작성에 성공했습니다.");
				}else {
					session.setAttribute("alertMsg", "채용요청서 문서 작성에 실패했습니다!");
				}
				
				
			}else if(ap.getFormNo().equals("5")) {
				
				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setFormNoName("SA-ER-");
				}
				
				// 일반품의서 신청
				int erResult = aService.insertExpenseReport(ap);
				
				
				if(erResult > 0) {
					session.setAttribute("alertMsg", "일반품의서 문서 작성에 성공했습니다.");
				}else {
					session.setAttribute("alertMsg", "일반품의서 문서 작성에 실패했습니다!");
				}
				
			}else if(ap.getFormNo().equals("1")) { // 수정중
				
				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setFormNoName("SA-BD-");
				}
				
				// 업무기안서 신청
				int bdResult = aService.insertBusinessDraft(ap);
				
				
				if(bdResult > 0) {
					session.setAttribute("alertMsg", "업무기안서 작성에 성공했습니다.");
				}else {
					session.setAttribute("alertMsg", "업무기안서 작성에 실패했습니다!");
				}
				
			}else { 
				
				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setFormNoName("SA-EB-");
				}
				
				// 비품구매품의서 신청
				int ebResult = aService.insertEquipmentBuy(ap);
				int ilResult = aService.insertItemList(itemList);
				
				
				if(ebResult > 0 && ilResult > 0) {
					session.setAttribute("alertMsg", "비품구매품의서 작성에 성공했습니다.");
				}else {
					session.setAttribute("alertMsg", "비품구매품의서 작성에 실패했습니다!");
				}
				
			}
		
		}
		
		int cfResult = aService.insertConfirm(confirmList);
		
		if((cfResult * result) < 1) {
			session.setAttribute("alertMsg", "공통문서, 결재자 등록 실패!");
		}
		
		
		return "redirect:onlist.el?status=A";
		
	}
	
	// 첨부파일용 메소드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 900 + 100);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/approval/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	/*수정하기 폼*/	
	@RequestMapping("updateForm.el")
	public ModelAndView updateFormApproval(ModelAndView mv, String ano) {
		
		String formNo = ano.substring(3,5); // 양식 조건비교할 값 담기
		
		Approval ap = aService.selectApproval(ano); // 제목~결재자까지 알아오기
		
		if(ap != null) {
			
			mv.addObject("ap", ap);	
			
			if(formNo.equals("BD")) { // 업무기안서 상세
				
				Approval bd = aService.selectBusinessDraft(ano);
				mv.addObject("bd", bd);
				
			}else if(formNo.equals("EB")) { // 비품구매 상세
				
				Approval eb = aService.selectEquipmentBuy(ano);
				mv.addObject("eb", eb);
				
			}else if(formNo.equals("CE")) { // 증명서 신청 상세
				
				Approval ce = aService.selectCertificate(ano);
				mv.addObject("ce", ce);
				
			}else if(formNo.equals("RC")) { // 채용요청서 상세
				
				Approval rc = aService.selectRecruiment(ano);
				mv.addObject("rc", rc);
				
			}else { // 일반품의서 상세
				
				Approval er = aService.selectExpenseReport(ano);
				mv.addObject("er", er);
				
			}
		
			mv.setViewName("approval/approvalUpdate");
			
		}
		return mv;
		
	} // 수정하기 폼으로 연결
	
	// 수정하기
	@RequestMapping("update.el")
	public ModelAndView updateApproval(ModelAndView mv, Approval ap, MultipartFile reupfile, HttpSession session) {
		
		ArrayList<Approval> confirmList = ap.getConfirmList();
		ArrayList<Approval> itemList = ap.getItemList();
		String ano = ap.getApprovalNo();

		String formNo = ap.getApprovalNo().substring(3,5); // 양식 조건비교할 값 담기
		
		int bdUpdate = 0;
		int ebUpdate = 0; 
		int ceUpdate = 0;
		int rcUpdate = 0;
		int erUpdate = 0;
		int reConfirm = 0;
		int listdelete = 0;
		int insertitem = 0;
		
		// 새로운 첨부파일 있을경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(ap.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(ap.getFilePath())).delete();
			} // 기존파일 삭제
			
			String changeName = saveFile(reupfile, session);
			ap.setOriginName(reupfile.getOriginalFilename());
			ap.setFilePath("resources/uploadFiles/approval/" + changeName);
			
		}

		int updateAp = aService.updateApproval(ap); // 공통테이블에 업데이트

		if(updateAp > 0) {

			if(formNo.equals("BD")) { // 업무기안서 상세
				
				bdUpdate = aService.updateBusinessDraft(ap);

				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setApprovalNo(ano);
				}
			}else if(formNo.equals("EB")) { // 비품구매 
				
				ebUpdate = aService.updateEquipmentBuy(ap); // 비품구매 수정
				listdelete = aService.deleteItemList(ano); // 기존 아이템들 삭제
				
				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setApprovalNo(ano);
				}
				
				for(int i=0; i<itemList.size(); i++){
					itemList.get(i).setApprovalNo(ano);
				}
				
				insertitem = aService.insertItemList(itemList); // 새로운 아이템 추가
				
			}else if(formNo.equals("CE")) { // 증명서 신청 
				
				ceUpdate = aService.updateCertificate(ap);
				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setApprovalNo(ano);
				}
				
			}else if(formNo.equals("RC")) { // 채용요청서 
				
				rcUpdate = aService.updateRecruiment(ap);
				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setApprovalNo(ano);
				}
				
			}else { // 일반품의서 상세
				
				erUpdate = aService.updateExpenseReport(ap);
				for(int i=0; i<confirmList.size(); i++) {
					confirmList.get(i).setApprovalNo(ano);
				}
				
			}
			
			aService.deleteConfirm(ano); // 기존 결재자 삭제
			reConfirm = aService.insertConfirm(confirmList); // 결재자 재 등록
			
		}

		if(reConfirm*bdUpdate > 0 
		   || reConfirm*ebUpdate*insertitem > 0
		   || ceUpdate*reConfirm > 0
		   || rcUpdate*reConfirm > 0
		   || erUpdate*reConfirm > 0) {
			session.setAttribute("alertMsg", "문서 수정에 성공했습니다.");
		}else {
			session.setAttribute("alertMsg", "문서 수정실패!");
		}

		mv.setViewName("redirect:onlist.el?status=D");
		return mv;
		
	} // 수정하기 끝
	
	
	
	/*삭제하기*/
	@RequestMapping("delete.el")
	public String deleteApproval(String ano, String filePath, HttpSession session) {
		
		int result = aService.deleteApproval(ano);
		
		if(result > 0) {
			
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "결재 문서가 삭제되었습니다.");
			return "redirect:main.el";
			
		}else {
			
			session.setAttribute("alertMsg", "결제 문서 삭제 실패!");
			return "redirect:detail.el";
		}
		
	}
	
	// 승인하기
	@RequestMapping("confirm.el")
	public String approvalConfirm(String ano, String userNo, String confirmStatus, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ano", ano);
		map.put("userNo", userNo);
		map.put("confirmStatus", confirmStatus);
		
		// 결재자 순번 알아오기
		int procedure = aService.selectConfirmProcedure(map);
		// 결재자 몇명인지 알아오기
		int count = aService.selectConfirmPeopleCount(ano);
		
		// 결재자 순번 상관없이 결재 테이블에 상태값 변경
		int confirmTable = aService.updateConfirmTable(map);

		if(procedure == 1) {
		
			aService.updateConfirmApproval(map); // 첫번째 결재자 승인시 전자결재 테이블 변경
		
		}

		if(procedure == count) {
			
			int last = aService.updateLastConfirm(ano);

		}
		
		if(confirmTable > 0) {
			
			session.setAttribute("alertMsg", "승인되었습니다.");
			return "redirect:standby.el";
			
		}else {
			
			session.setAttribute("alertMsg", "승인 실패!");
			return "redirect:detail.el";
			
		}
		
	} // 승인하기 끝
	
	// 반려하기
	@RequestMapping("reject.el")
	public String rejectApproval(String ano, String userNo, String rejectReason, HttpSession session) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ano", ano);
		map.put("userNo", userNo);
		map.put("rejectReason", rejectReason);

		int rejectResult = aService.updateConfirmReject(map);
		int confirmTable = aService.updateConfirmApproval(map);
		
		int result = confirmTable * rejectResult;
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "반려되었습니다.");
			return "redirect:standby.el";
			
		}else {
			
			session.setAttribute("alertMsg", "반려 실패!");
			return "redirect:detail.el";
			
		}
		
	} // 반려하기
	
	// 결재창에서 이름으로 검색하기
	@ResponseBody
	@RequestMapping(value="searchConfirm.el", produces="application/json; charset=UTF-8")
	public String ajaxSelectSearchConfirm(String keyword) {
		
		ArrayList<Employee> result = eService.ajaxSelectSearchConfirm(keyword);
		
		return new Gson().toJson(result);
	}
	
	// 승인완료된 문서목록(결재자기준)
	@RequestMapping("doneConf.el")
	public String selectDoneConfirmList(Model model, HttpSession session) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		ArrayList<Approval> donelist = aService.selectDoneConfirmList(userNo);
		
		model.addAttribute("donelist", donelist);
		
		return "approval/doneConfirmList";
		
	}
		
	/*전자결재 관리자 파트*/
	
	@RequestMapping("deletelist.el")
	public String selectDeleteList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model, HttpSession session) {
		
		int listCount = aService.selectDeleteListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
	
		ArrayList<Approval> dltlist = aService.selectDeleteList(pi);
		
		String deptCode = ((Employee)session.getAttribute("loginUser")).getDeptCode();

		model.addAttribute("depi", pi);
		model.addAttribute("dltlist", dltlist);
		model.addAttribute("deptCode", deptCode);
		
		return "approval/adminDeleteList";
		
	} // 삭제문서리스트
	
	@RequestMapping("delSearch.el")
	public String deleteSearchList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model, String subject, String keyword) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("subject", subject);
		map.put("keyword", keyword);
		
		int searchCount = aService.selectSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		
		ArrayList<Approval> dltlist = aService.selectDeleteSearchList(pi,map);
		
		model.addAttribute("depi", pi);
		model.addAttribute("dltlist", dltlist);
		model.addAttribute("keyword", keyword);
		model.addAttribute("subject", subject);
		
		return "approval/adminDeleteList";
	} // 삭제문서 검색하기
	
	@ResponseBody
	@RequestMapping(value="restore.el", produces="application/text; charset=UTF-8")
	public String ajaxDeleteRestore(Approval approvalNo) {
		
		String[] apNum = approvalNo.getApprovalNo().split(",");
		
		int result = aService.ajaxDeleteRestore(apNum);
		
		return result > 0 ? "S" : "F";
		
	} // 문서 복구하기

	// 전자결재 관리자 목록
	@RequestMapping("approvalad.el")
	public String approvalAdminList(Model model) {
		
		ArrayList<Employee> adlist = eService.selectAdminList();
		ArrayList<Employee> deptList = eService.selectDeptList();

		model.addAttribute("deptList", deptList);
		model.addAttribute("adlist", adlist);
		
		return "approval/approvalAdmin";
		
	}
	
	@ResponseBody
	@RequestMapping(value="searchAdmin.el", produces="application/json; charset=UTF-8")
	public String ajaxAdminSearchSelect(String deptCode, String userName) {

		HashMap<String,String> map = new HashMap<String,String>();
		map.put("deptCode", deptCode);
		map.put("userName", userName);
		
		ArrayList<Employee> list = eService.ajaxAdminSearchSelect(map);
		
		return new Gson().toJson(list);
		
	} // 문서 복구하기
	
	@RequestMapping("deletead.el")
	public String deletAdmin(String adno, HttpSession session) {
		
		String[] adNo = adno.split(",");
		
		int result = eService.deleteAdmin(adNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "관리자에서 해제되었습니다!");
		}else {
			session.setAttribute("alertMsg", "관리자 해제 실패!");
		}
		
		return "redirect:approvalad.el";
		
	} // 관리자 해체하기
	
	@RequestMapping("registerad.el")
	public String approvalAdminUpdate(String uno, HttpSession session) {
		
		int result = eService.approvalAdminUpdate(uno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "전자결재 관리자로 등록되었습니다.");
		}else {
			session.setAttribute("alertMsg", "관리자 등록 실패!");
		}
		
		return "redirect:approvalad.el";
	} // 관리자 등록하기
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
