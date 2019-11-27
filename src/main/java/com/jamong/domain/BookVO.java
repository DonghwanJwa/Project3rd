package com.jamong.domain;

/** Database book Table Value Object **/
public class BookVO {

	
	private int book_no;
	private String book_name;
	private String book_date;
	private String book_editdate;
	private int fav_no;
	private int mem_no;
	
	// Setter()
	public void setBook_no(int book_no) 			   {		this.book_no = book_no;					}
	public void setBook_name(String book_name) 		   {		this.book_name = book_name;				}
	public void setBook_date(String book_date) 		   {		this.book_date = book_date;				}
	public void setBook_editdate(String book_editdate) {		this.book_editdate = book_editdate;		}
	public void setFav_no(int fav_no) 				   {		this.fav_no = fav_no;					}
	public void setMem_no(int mem_no) 				   {		this.mem_no = mem_no;					}			

	// Getter()
	public int getBook_no() 		 {		return book_no;			}
	public String getBook_name() 	 {		return book_name;		}
	public String getBook_date() 	 {		return book_date;		}
	public String getBook_editdate() {		return book_editdate;	}
	public int getFav_no() 			 {		return fav_no;			}
	public int getMem_no() 			 {		return mem_no;			}
	
}
