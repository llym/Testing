package com.test.entity;

public class Book {
	    private Integer id;

	    private String bookname;

	    private String author;

	    private String press;
	    
	    private String inventory;//出版社
	    
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

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}
	    
}
