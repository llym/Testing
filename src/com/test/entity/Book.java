package com.test.entity;

public class Book {
	    private Integer id;

	    private String bookname;

	    private String author;

	    private String press;//出版社
	    
	    private Integer inventory;//库存
	    
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

		public Integer getInventory() {
			return inventory;
		}

		public void setInventory(Integer inventory) {
			this.inventory = inventory;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}
	    
}
