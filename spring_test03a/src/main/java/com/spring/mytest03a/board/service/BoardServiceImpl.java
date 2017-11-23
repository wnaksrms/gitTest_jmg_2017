package com.spring.mytest03a.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.mytest03a.board.dao.BoardDAO;
import com.spring.mytest03a.board.dto.BoardDTO;


@Repository("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO boardDAO;
	public HashMap listBoard() throws DataAccessException{
		ArrayList public_list=boardDAO.listBoard("y");
		ArrayList private_list=boardDAO.listBoard("n");
		HashMap map=new HashMap();
		map.put("public_list", public_list);
		map.put("private_list", private_list);
		return map;
		
	}
	
	//public BoardDTO writeDetail(int num) throws DataAccessException{
	public HashMap writeDetail(int num) throws DataAccessException{
		HashMap writeMap=new HashMap();
		BoardDTO boardDTO =boardDAO.writeDetail(num);
		ArrayList imageList=boardDAO.listImageFile(num);
		writeMap.put("write", boardDTO);
		writeMap.put("imageList",imageList);
		return writeMap;
	}
	
	public void delWrite(int num) throws DataAccessException{
		boardDAO.delWrite(num);
	}
	
	public int addWrite(HashMap writeMap) throws DataAccessException{
		int num=boardDAO.getPrimaryKey();
		writeMap.put("num", num);
		boardDAO.addWrite(writeMap);
		//이미지 정보를  t_image에 추가한다.
		ArrayList fileList=(ArrayList)writeMap.get("fileList");
		boardDAO.addImageFile(fileList,num);
		return num;
	}
	public void modWrite(HashMap writeMap) throws DataAccessException{
		boardDAO.modWrite(writeMap);
	}
}
