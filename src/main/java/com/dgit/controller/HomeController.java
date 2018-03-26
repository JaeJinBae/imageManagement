package com.dgit.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.MemberVO;
import com.dgit.service.MemberService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService service;
	
	@Resource(name="uploadPath")
	private String outUploadPath;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "home";
	}
	
	//@ResponseBody
	@RequestMapping(value="{id}/{pw}",method=RequestMethod.POST)
	public ResponseEntity<String> loginCheck(@PathVariable("id") String id,@PathVariable("pw") String pw, HttpServletRequest req) throws Exception{
		logger.info("로그인");
		ResponseEntity<String> entity=null;
		
		MemberVO vo=service.selectById(id);
		//int mno=vo.getMno();
		
		HttpSession session= req.getSession();
		
		if(vo!=null){
			if(vo.getPw().equals(pw)){
				entity=new ResponseEntity<String>("1",HttpStatus.OK);
				System.out.println("======= : "+vo);
				session.setAttribute("id", id);
			}
		}else{
			entity=new ResponseEntity<String>("0",HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping()
	public String logout(HttpServletRequest req){
		HttpSession session=req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="imgList",method=RequestMethod.GET)
	public String imgListGet(HttpServletRequest req,Model model) throws Exception{
		logger.info("imgListGet");
		HttpSession session=req.getSession();
		MemberVO vo=service.selectById(session.getAttribute("id").toString());
		int mno=vo.getMno();
		model.addAttribute("mno",mno);
		
		return "imgList";
	}
	
	@RequestMapping(value="addImg/{mno}", method=RequestMethod.GET)
	public String addImgGet(@PathVariable("mno") int mno,HttpServletRequest req, Model model) throws Exception{
		logger.info("addImgGet");
		
		/*HttpSession session=req.getSession();
		MemberVO vo=service.selectById(session.getAttribute("id").toString());
		int mno=vo.getMno();*/
		model.addAttribute("mno",mno);
		return "addImg";
	}
	
	@RequestMapping(value="addImg", method=RequestMethod.POST)
	public String addImgPost(int mno, List<MultipartFile> imageFiles, RedirectAttributes rttr) throws Exception{
		logger.info("add Images Post");
		
		if(imageFiles.get(0).getBytes().length != 0){
			String[] files=new String[imageFiles.size()];
			
			for(int i=0;i<files.length;i++){
				logger.info("file : " + imageFiles.get(i).getOriginalFilename());
				String savedName=UploadFileUtils.uploadFile(outUploadPath, imageFiles.get(i).getOriginalFilename(), imageFiles.get(i).getBytes());
				files[i]=outUploadPath+savedName;
				service.addAttach(files[i].toString(), mno);
			}			
		}
		return "redirect:/imgList";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String registerGet() {		
		
		return "registerForm";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerPost(MemberVO vo) throws Exception {		
		
		service.insert(vo);
		return "home";
	}
	
	@RequestMapping(value="idConfirm/{id}",method=RequestMethod.GET)
	public ResponseEntity<String> idConfirm(@PathVariable("id") String id) throws Exception{
		logger.info("idCheck");
		ResponseEntity<String> entity=null;
		
		MemberVO vo=service.selectById(id);
		if(vo==null){
			entity=new ResponseEntity<String>("0",HttpStatus.OK);
		}else{
			entity=new ResponseEntity<String>("1",HttpStatus.OK);
		}
		return entity;		
	}
	
	@ResponseBody
	@RequestMapping(value="displayFile",method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String filename){
		ResponseEntity<byte[]> entity=null;
		InputStream in=null;
		
		logger.info("[displayFilename]: "+filename); // /2018/03/19/asdf.jpg
		
		try {
			String formatName=filename.substring(filename.lastIndexOf(".")+1);
			MediaType type=MediaUtils.getMediaType(formatName);
			HttpHeaders headers=new HttpHeaders();
			headers.setContentType(type);
			
			in=new FileInputStream(filename);
			
			entity=new ResponseEntity<>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
}
