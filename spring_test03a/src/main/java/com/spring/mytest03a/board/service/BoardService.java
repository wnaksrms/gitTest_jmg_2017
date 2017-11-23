package com.spring.mytest03a.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.spring.mytest03a.board.dto.BoardDTO;

public interface BoardService {
	public HashMap listBoard() throws DataAccessException;
	public HashMap writeDetail(int num) throws DataAccessException;
	public void modWrite(HashMap writeMap) throws DataAccessException;
	public void delWrite(int num) throws DataAccessException;
	public int addWrite(HashMap writeMap) throws DataAccessException;
}
