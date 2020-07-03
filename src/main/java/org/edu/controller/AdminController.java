package org.edu.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.edu.service.IF_BoardService;
import org.edu.service.IF_MemberService;
import org.edu.vo.BoardVO;
import org.edu.vo.MemberVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminController {

   @Inject
   private IF_BoardService boardService;

   @Inject
   private IF_MemberService memberService;
   
   //첨부파일 업로드 경로를 변수 값으로 가져옴 servlet-context.xml에 있었음.
   @Resource(name= "uploadPath")
   private String uploadPath;
   
   /**
    * 게시물 상세보기에서 첨부파일 다운로드 메서드 구현
    * 
    */
   @RequestMapping(value="/download", method=RequestMethod.GET) //웹브라우저에서 접근(요쳥)
   @ResponseBody //접근시 어떤 것을 주라(응답)
   public FileSystemResource fileDownload(@RequestParam("filename") String fileName, HttpServletResponse response) {
	  //String으로 받아 fileName으로 쓸거. 응답은 Http~로 응답줄거
	   File file = new File(uploadPath + "/" + fileName);//uploadPath안 fileName을 잡아오려고
	   response.setContentType("application/download; utf-8");
	   response.setHeader("Content-Disposition", "attachment; filename="+fileName);
	   return new FileSystemResource(file);
   }
   
   
   /**
    * 게시물관리 리스트 입니다.
    * @throws Exception
    */
   @RequestMapping(value = "/admin/board/list", method = RequestMethod.GET)
   public String boardList(Locale locale, Model model) throws Exception {
      List<BoardVO> list = boardService.selectBoard();
      // 모델클래스로 jsp화면으로 boardService에서 셀렉트한 list값을 boardList변수명으로 보낸다.
      // model { list -> boardList -> jsp }
      model.addAttribute("boardList", list);
      return "admin/board/board_list";
   }
   
   /**
    * 게시물관리 상세보기 입니다.
    * @throws Exception
    */
   @RequestMapping(value = "/admin/board/view", method = RequestMethod.GET) 
   //url은 최대한 짧게
   public String boardview(@RequestParam("bno") Integer bno, Locale locale, Model model) throws Exception {
      // 모델클래스로 jsp화면으로 boardService에서 셀렉트한 list값을 boardList변수명으로 보낸다.
      // model { list -> boardList -> jsp }
	   BoardVO boardVO = boardService.viewBoard(bno);
	   //여기서부터 첨부파일명 때문에 추가
    List<String> files = boardService.selectAttach(bno); 
	String[] filenames = new String[files.size()];
	int cnt = 0;
	for(String fileName : files) {
		filenames[cnt++] = fileName;//실제뽑은 fileName을 하나씩 꺼냄.
	}
      
     //여러개 파일에서 1개 파일만 받는 것으로 변경
    // String[] filenames = new String[] {files};
      boardVO.setFiles(filenames);//String[]. 넣어야 매개변수 boardVO에 파일목록이 들어가. 
    //여기까지 첨부파일때문에 추가
      model.addAttribute("boardVO", boardVO);
      return "admin/board/board_view";
   }

   /**
    * 게시물관리 > 등록 입니다.
    * @throws Exception
    */
   @RequestMapping(value = "/admin/board/write", method = RequestMethod.GET)
      public String boardWrite(Locale locale, Model model) throws Exception {  
      return "admin/board/board_write";
   }
   @RequestMapping(value = "/admin/board/write", method = RequestMethod.POST)
      public String boardWrite(MultipartFile file, BoardVO boardVO, Locale locale, RedirectAttributes rdat) throws Exception {   
    if(file.getOriginalFilename() == "") {
    	//첨부파일 없이 저장
    	boardService.insertBoard(boardVO); 
    }else {
	   // System.out.println("===첨부파일여부없이저장===" + file.getOriginalFilename());
	    String orginalName = file.getOriginalFilename();//jsp에서 전송받은 파일의 이름
      UUID uid = UUID.randomUUID(); //랜덤문자 구하기. 랜덤하게 아이디 만들때 씀.
      String saveName = uid.toString() + "." + orginalName.split("\\.")[1]; //upload에 uid로 저장
	  String[] files = new String[] {saveName};//getset으로 하려new String[]으로 형변환. 배열선언이유-BoardVO에 files이라는 변수를 배열로 만들어서. 
	  boardVO.setFiles(files); //set으로 files저장. 
	   boardService.insertBoard(boardVO); //copy아래가 맞는것같은데 아래두면 에러시 첨부파일이 쌓이게됨.
	  //위는 DB에 첨부파일명을 저장하기 까지
	  //여기서 부터 실제 파일을 폴더에 저장하기 시작
	   byte[] fileData = file.getBytes();
	   File target = new File(uploadPath, saveName);
	   FileCopyUtils.copy(fileData, target);
    }
	   rdat.addFlashAttribute("msg","입력");
	   return "redirect:/admin/board/list";      
   }
   
   /**
    * 게시물관리 > 삭제 입니다.
    * @throws Exception
    */
   @RequestMapping(value = "/admin/board/delete", method = RequestMethod.POST)
      public String boardDelete(@RequestParam("bno") Integer bno, Locale locale, RedirectAttributes rdat) throws Exception {  
	   List<String> files = boardService.selectAttach(bno); 
	   boardService.deleteBoard(bno);
	   
	  //첨부파일 삭제(아래)
		for(String fileName : files) {
			//삭제 명령문추가(아래)
			File target = new File(uploadPath, fileName);
			 if(target.exists()) {
				 target.delete();
			 }		
		}	  
	  rdat.addFlashAttribute("msg", "삭제");
	      return "redirect:/admin/board/list";
   }
   
   /**
    * 회원관리 리스트 입니다.
    * @throws Exception
    */
   @RequestMapping(value = "/admin/member/list", method = RequestMethod.GET)
   public String memberList(Locale locale, Model model) throws Exception {
      List<MemberVO> list = memberService.selectMember();
      // 모델클래스로 jsp화면으로 memberService에서 셀렉트한 list값을 memberList변수명으로 보낸다.
      // model { list -> memberList -> jsp }
      model.addAttribute("memberList", list);
      return "admin/member/member_list";
   }

   /**
    * 회원관리 상세보기 입니다.
    * @throws Exception
    */
   @RequestMapping(value = "/admin/member/view", method = RequestMethod.GET)
   // 홈페이지 상단에 들어가는 URL
   public String memberView(@RequestParam("user_id") String user_id, Locale locale, Model model) throws Exception {
      // Local=다국어지원,Model=데이터베이스와연동
      MemberVO memberVO = memberService.viewMember(user_id);
      model.addAttribute("memberVO", memberVO);
      return "admin/member/member_view";
   }
  
   /**
    * 회원관리 > 등록 입니다. 
    * @throws Exception
    */
   @RequestMapping(value = "/admin/member/write", method = RequestMethod.GET)
      public String memberWrite(Locale locale, Model model) throws Exception {   
      return "admin/member/member_write";
   }
   @RequestMapping(value = "/admin/member/write", method = RequestMethod.POST)
      public String memberWrite(MemberVO memberVO, Locale locale, RedirectAttributes rdat) throws Exception {   
      memberService.insertMember(memberVO);
      rdat.addFlashAttribute("msg", "입력");
      return "redirect:/admin/member/list";
   }

   @RequestMapping(value = "/admin/board/update", method = RequestMethod.GET)
      public String boardUpdate(@RequestParam("bno") Integer bno, Locale locale, Model model) throws Exception {   
      BoardVO boardVO = boardService.viewBoard(bno);
      model.addAttribute("boardVO", boardVO);
      return "admin/board/board_update";
   }  
   @RequestMapping(value = "/admin/board/update", method = RequestMethod.POST)
      public String boardUpdate(BoardVO boardVO, Locale locale, RedirectAttributes rdat) throws Exception {   
      boardService.updateBoard(boardVO);
      rdat.addFlashAttribute("msg", "수정");
      return "redirect:/admin/board/view?bno=" + boardVO.getBno();      
   }
   
   /**
    * 회원관리 > 수정 입니다. 
    * @throws Exception
    */
   @RequestMapping(value = "/admin/member/update", method = RequestMethod.GET)
      public String memberUpdate(@RequestParam("user_id") String user_id, Locale locale, Model model) throws Exception {   
      MemberVO memberVO = memberService.viewMember(user_id);
      model.addAttribute("memberVO", memberVO);
      return "admin/member/member_update";
   }  
   @RequestMapping(value = "/admin/member/update", method = RequestMethod.POST)
      public String memberUpdate(MemberVO memberVO, Locale locale, RedirectAttributes rdat) throws Exception {   
      memberService.updateMember(memberVO);
      rdat.addFlashAttribute("msg","수정");
      return "redirect:/admin/member/view?user_id=" + memberVO.getUser_id();
   }
   
   /**
    * 회원관리 > 삭제 입니다. 200701 
    * @throws Exception
    */
   @RequestMapping(value = "/admin/member/delete", method = RequestMethod.POST)
      public String memberDelete(@RequestParam("user_id") String user_id, Locale locale, RedirectAttributes rdat) throws Exception {   
	   memberService.deleteMember(user_id);
	   rdat.addFlashAttribute("msg","삭제");
      return "redirect:/admin/member/list";
   }  
   
   /**
    * 관리자 홈 입니다.
    */
   @RequestMapping(value = "/admin", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      return "admin/home";
   }
}