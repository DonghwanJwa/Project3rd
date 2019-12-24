package com.jamong.domain;

/** Database book Table Value Object **/
public class BookVO {

	
	private int book_no;
	private String book_name;
	private String book_cover;
	private String book_preface;
	private String book_date;
	private String book_editdate;
	private String cat_name;
	private int mem_no;
	
	private MemberVO memberVO;
	private BoardVO boardVO;
	
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	// Setter()
	public void setBook_no(int book_no) 			   {		this.book_no = book_no;					}
	public void setBook_name(String book_name) 		   {		this.book_name = book_name;				}
	public void setBook_cover(String book_cover) 	   {		this.book_cover = book_cover;			}
	public void setBook_preface(String book_preface)   {		this.book_preface = book_preface;		}
	public void setBook_date(String book_date) 		   {		this.book_date = book_date;				}
	public void setBook_editdate(String book_editdate) {		this.book_editdate = book_editdate;		}
	public void setCat_name(String cat_name) 	       {		this.cat_name = cat_name;				}
	public void setMem_no(int mem_no) 				   {		this.mem_no = mem_no;					}			

	// Getter()
	public int getBook_no() 		 {		return book_no;			}
	public String getBook_name() 	 {		return book_name;		}
	public String getBook_cover() 	 {		return book_cover;		}
	public String getBook_preface()  {		return book_preface;	}
	public String getBook_date() 	 {		return book_date;		}
	public String getBook_editdate() {		return book_editdate;	}
	public String getCat_name() 	 {		return cat_name;		}
	public int getMem_no() 			 {		return mem_no;			}
	
}
