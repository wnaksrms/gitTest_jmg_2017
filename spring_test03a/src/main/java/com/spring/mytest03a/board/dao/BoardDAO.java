package com.spring.mytest03a.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.spring.mytest03a.board.dto.BoardDTO;

public interface BoardDAO {
	public ArrayList listBoard(String publicWrite) throws DataAccessException;
	public BoardDTO writeDetail(int num) throws DataAccessException;
	public void delWrite(int num) throws DataAccessException;
	public void addWrite(HashMap writeMap) throws DataAccessException;
	public int getPrimaryKey() throws DataAccessException;
	public void modWrite(HashMap writeMap) throws DataAccessException;
	public void addImageFile(ArrayList fileList,int num) throws DataAccessException;
	public ArrayList listImageFile(int num) throws DataAccessException;
}
