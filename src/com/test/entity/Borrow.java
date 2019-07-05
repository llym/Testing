package com.test.entity;

import java.util.Date;

public class Borrow {
	  private Integer id;

	    private String bookname;

	    private String author;

	    private String press;
	    
	    private String inventory;//出版社
	    
	    private String studynumb;
	    
	    private String name;
	    
	    private Date borrowtime;
	    
	    private Date returntime;
	    
	    private String status;

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getBookname() {
			return bookname;
		}

		public void setBookname(String bookname) {
			this.bookname = bookname;
		}

		public String getAuthor() {
			return author;
		}

		public void setAuthor(String author) {
			this.author = author;
		}

		public String getPress() {
			return press;
		}

		public void setPress(String press) {
			this.press = press;
		}

		public String getInventory() {
			return inventory;
		}

		public void setInventory(String inventory) {
			this.inventory = inventory;
		}

		public String getStudynumb() {
			return studynumb;
		}

		public void setStudynumb(String studynumb) {
			this.studynumb = studynumb;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Date getBorrowtime() {
			return borrowtime;
		}

		public void setBorrowtime(Date borrowtime) {
			this.borrowtime = borrowtime;
		}

		public Date getReturntime() {
			return returntime;
		}

		public void setReturntime(Date returntime) {
			this.returntime = returntime;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}
}
