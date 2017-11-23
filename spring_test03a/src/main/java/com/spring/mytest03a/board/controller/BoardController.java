package com.spring.mytest03a.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.spring.mytest03a.HomeController;
import com.spring.mytest03a.board.service.BoardService;


@Controller
public class BoardController extends MultiActionController{
	private static String IMAGE_DIR="c:\\board_repo\\";

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/board/listBoard.do",method=RequestMethod.GET)
	public ModelAndView listBoard(HttpServletRequest request,HttpServletResponse response)
			throws Exception {
		
	System.out.println("listBoard �޼��� ȣ��");
	HashMap map=boardService.listBoard();
	ModelAndView mav=new ModelAndView("/board/listBoard");
	mav.addObject("map",map);
	return mav;
}
	
	@RequestMapping(value="/board/writeDetail.do",method=RequestMethod.GET)
	public ModelAndView writeDetail(HttpServletRequest request,HttpServletResponse response)
			throws Exception {
		
		System.out.println("writeDetail �޼��� ȣ��");
		String _num=request.getParameter("num");
		int num=Integer.parseInt(_num);
		System.out.println("num="+num);
		HashMap map=boardService.writeDetail(num);
		
	/*ArrayList boardList=boardService.listBoard();*/
	ModelAndView mav=new ModelAndView("/board/writeDetail");
	mav.addObject("map",map);
	return mav;
}
	
	@RequestMapping(value="/board/modWrite.do",method=RequestMethod.POST)
	public ModelAndView modWrite(MultipartHttpServletRequest multipartRequest,HttpServletResponse response)
			throws Exception {
		
		System.out.println("modWrite �޼��� ȣ��");
		
		HashMap writeMap=new HashMap();
		writeMap=modWriteFileUpload(multipartRequest);
		boardService.modWrite(writeMap);
		String num=(String)writeMap.get("num");
		String imageFile=(String)writeMap.get("imageFile");
		//���� �� ���ε�� �̹����� �۹�ȣ ������ �̵��ؾ��Ѵ�.
		String oldImageFile=(String)writeMap.get("oldImageFile");
		File srcFile=new File(IMAGE_DIR+imageFile);
		File destDir=new File(IMAGE_DIR+num);
		FileUtils.copyFileToDirectory(srcFile, destDir);
		srcFile.delete();
		
		File oldImage=new File(IMAGE_DIR+"\\"+num+"\\"+oldImageFile);
		oldImage.delete();
		
		ModelAndView mav=new ModelAndView("redirect:writeDetail.do");
		mav.addObject("num",num);
		return mav;
}
	@RequestMapping(value="/board/delWrite.do",method=RequestMethod.GET)
	public ModelAndView delWrite(HttpServletRequest request,HttpServletResponse response)
			throws Exception {
		
		System.out.println("delWrite �޼��� ȣ��");
		String _num=request.getParameter("num");
		int num=Integer.parseInt(_num);
		boardService.delWrite(num);
		
		//�̹��� ���� ����
		File destDir=new File(IMAGE_DIR+num);
		FileUtils.deleteDirectory(destDir);
		
		ModelAndView mav=new ModelAndView("redirect:listBoard.do");
	return mav;
}
	
	@RequestMapping(value="/board/addWrite.do",method=RequestMethod.POST)
	public ModelAndView addWrite(MultipartHttpServletRequest multipartRequest,HttpServletResponse response)
			throws Exception {
		HashMap writeMap=new HashMap();
		writeMap=addNewFileUpload(multipartRequest);
		HttpSession session=multipartRequest.getSession();
		String id=(String)session.getAttribute("id");
		writeMap.put("id", id);
		
		int num=boardService.addWrite(writeMap);
		
		//String imageFile=(String)writeMap.get("imageFile");
		ArrayList fileList=(ArrayList)writeMap.get("fileList");
		for(int i=0;i<fileList.size();i++) {
		String imageFile=(String)fileList.get(i);
		File srcFile=new File(IMAGE_DIR+imageFile);
		File destDir=new File(IMAGE_DIR+num);
		FileUtils.copyFileToDirectory(srcFile, destDir,true);
		srcFile.delete();
		}
		ModelAndView mav=new ModelAndView("redirect:listBoard.do");
		return mav;
}
	@RequestMapping(value="/board/writeForm.do",method=RequestMethod.GET)
	public ModelAndView writeForm(HttpServletRequest request,HttpServletResponse response)
			throws Exception {
		
	ModelAndView mav=new ModelAndView("/board/writeForm");
	return mav;
}
	private HashMap addNewFileUpload(MultipartHttpServletRequest multipartRequest)
			throws Exception {
		HashMap writeMap=new HashMap();
	      ArrayList fileList=new ArrayList();
	      String path="c:\\board_repo\\";
	      System.out.println("write �޼��� ȣ��");
	      Enumeration enu=multipartRequest.getParameterNames();
	      while(enu.hasMoreElements()) {
	         String key=(String)enu.nextElement();
	         String value=multipartRequest.getParameter(key);
	         System.out.println("key="+key+ " ,value"+value);
	         writeMap.put(key, value);
	      }
	      
	      Iterator<String> fileNames=multipartRequest.getFileNames();
	      while(fileNames.hasNext()){
	         String fileName=fileNames.next();
	         System.out.println("fileName="+fileName);
	         MultipartFile mFile=multipartRequest.getFile(fileName);
	         String originaleFileName=mFile.getOriginalFilename();
	         if(originaleFileName==null || originaleFileName.length()==0) {
	        	 continue;
	         }
	         //�̹��������� ������ �ֱ����� ��̸���Ʈ�� ����Ѵ�. 
	         //writeMap.put("imageFile", originaleFileName);������ ����ҋ� �̷��� put �ؼ� �ϳ��� �־���
	         
	         fileList.add(originaleFileName);
	         File file=new File(path+fileName);
	         
	         if(mFile.getSize() != 0) {
	            if(!file.getParentFile().mkdirs()) {
	               file.createNewFile();
	            }
	         }
	         mFile.transferTo(new File(path+originaleFileName));
	      }//end while
	      
	      writeMap.put("fileList", fileList);
	      return writeMap;
	   }
	private HashMap modWriteFileUpload(MultipartHttpServletRequest multipartRequest)
			throws Exception {
		HashMap writeMap=new HashMap();
		String path="c:\\board_repo\\";
		System.out.println("modWriteFileUpload �޼��� ȣ��");
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String key=(String)enu.nextElement();
			String value=multipartRequest.getParameter(key);
			System.out.println("key="+key+ ", value="+value);
			writeMap.put(key, value);
		}
		Iterator<String> fileNames=multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			String fileName=fileNames.next();
			System.out.println("fileName="+fileName);
			MultipartFile mFile=multipartRequest.getFile(fileName);
			String originaleFileName=mFile.getOriginalFilename();
			writeMap.put("imageFile",originaleFileName);
			File file=new File(path+fileName);
			
			if(mFile.getSize()!=0) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(path+originaleFileName));
		}
		return writeMap;
	}
}
