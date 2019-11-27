package com.jamong.domain;

/** Database recommend Table Value Object **/
public class RecommendVO {

	private int rec_no;
	private int book_no;
	private int mem_no;
	
	// Setter()
	public void setRec_no(int rec_no) 	{		this.rec_no = rec_no;		}
	public void setBook_no(int book_no) {		this.book_no = book_no;		}
	public void setMem_no(int mem_no) 	{		this.mem_no = mem_no;		}

	// Getter()
	public int getRec_no() 	{		return rec_no;		}
	public int getBook_no() {		return book_no;		}
	public int getMem_no() 	{		return mem_no;		}	
}
