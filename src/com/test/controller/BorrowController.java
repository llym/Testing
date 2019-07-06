package com.test.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.entity.Book;
import com.test.entity.Borrow;
import com.test.service.BorrowService;

@Controller
public class BorrowController {
	@Autowired
	private BorrowService borrowService;
	@RequestMapping("/changePage2")
	public ModelAndView changePage2(int pageAdd,int currentPage) {
		System.out.println("借阅历史换页");
		currentPage+=pageAdd;
		System.out.println(currentPage);
		int recordNum=borrowService.getRecordNum();
		System.out.println("共"+recordNum);
		int pageSize = 3;
		int pages;
		List<Borrow> list = new ArrayList<Borrow>();
		if(recordNum%pageSize !=0) {
			pages = recordNum/pageSize +1;
		}else 
			pages = recordNum/pageSize;
		if(currentPage<=pages) {
			int currIndex = (currentPage -1) *pageSize;
			Map<String,Object> map = new HashedMap();
			map.put("currIndex", currIndex);
			map.put("pageSize", pageSize);
			list = borrowService.getCurrPageBorrow(map);
		}
		
		ModelAndView mav =new ModelAndView("adminHistory");
		mav.addObject("recordNum",recordNum);
		mav.addObject("currentPage",currentPage);
		mav.addObject("pages",pages);
		mav.addObject("historys",list);
		return mav;
	}
}
