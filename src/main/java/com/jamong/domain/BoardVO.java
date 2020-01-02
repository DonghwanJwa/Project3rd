package com.jamong.domain;

/** Database board Table Value Object **/
public class BoardVO {

	private int bo_no;
	private String bo_title;
	private String bo_subtitle;
	private String bo_cont;
	private int bo_hit;
	private String bo_date;
	private String bo_editdate;
	private String bo_thumbnail;
	private String bo_color;
	private int bo_titlespace;
	private int bo_lock;
	private int bo_like;
	private int book_order;
	private String cat_name;
	private int mem_no;
	private int book_no;
	
	private String find_name;
	private String find_field;
	private String find_field2; // 191231 관리자페이지 검색을 위해 추가
	private String find_field3; // 191231 관리자페이지 검색을 위해 추가
	
	private int startrow; // 191231 관리자 페이지 페이징을 위해 추가
	private int endrow;	  // 191231 관리자 페이지 페이징을 위해 추가
	
	private MemberVO memberVO;
	private BookVO bookVO;
	


	// Setter()
	public void setBo_date(String bo_date)		   	 {		this.bo_date = bo_date;				}
	public void setBo_editdate(String bo_editdate) 	 {		this.bo_editdate = bo_editdate;		}
	public void setBo_lock(int bo_lock) 		   	 {		this.bo_lock = bo_lock;				}
	public void setBo_like(int bo_like) 		   	 {		this.bo_like = bo_like;				}
	public void setBook_order(int book_order) 	   	 {		this.book_order = book_order;		}
	public void setCat_name(String cat_name) 		 {		this.cat_name = cat_name;			}
	public void setMem_no(int mem_no) 			   	 {		this.mem_no = mem_no;				}
	public void setBook_no(int book_no) 		     {		this.book_no = book_no;				}
	public void setBo_no(int bo_no) 			   	 {		this.bo_no = bo_no;					}
	public void setBo_title(String bo_title) 	   	 {		this.bo_title = bo_title;			}
	public void setBo_subtitle(String bo_subtitle) 	 {		this.bo_subtitle = bo_subtitle;		}
	public void setBo_cont(String bo_cont) 		   	 {		this.bo_cont = bo_cont;				}
	public void setBo_hit(int bo_hit) 			  	 {		this.bo_hit = bo_hit;				}
	public void setBo_thumbnail(String bo_thumbnail) {		this.bo_thumbnail = bo_thumbnail;	}
	public void setFind_field(String find_field)   	 {		this.find_field = find_field;		}
	public void setFind_field2(String find_field2) 	 {		this.find_field2 = find_field2;		}
	public void setFind_field3(String find_field3) 	 {		this.find_field3 = find_field3;		}
	public void setFind_name(String find_name) 	   	 {		this.find_name = find_name;			}
	public void setStartrow(int startrow) 			 {		this.startrow = startrow;			}
	public void setEndrow(int endrow) 				 {		this.endrow = endrow;				}
	public void setMemberVO(MemberVO memberVO) 		 {		this.memberVO = memberVO;			}
	public void setBo_color(String bo_color) 		 {		this.bo_color = bo_color;			}
	public void setBo_titlespace(int bo_titlespace)  {		this.bo_titlespace = bo_titlespace;	}
	public void setBookVO(BookVO bookVO) 			 {		this.bookVO = bookVO;				}
	
	// Getter()
	public int getBo_no() 		   	{		return bo_no;			}
	public String getBo_title()    	{		return bo_title;		}
	public String getBo_subtitle() 	{		return bo_subtitle;		}
	public String getBo_cont() 	   	{		return bo_cont;			}
	public int getBo_hit() 		   	{		return bo_hit;			}
	public String getBo_date() 	   	{		return bo_date;			}
	public String getBo_editdate() 	{		return bo_editdate;		}
	public int getBo_lock() 	   	{		return bo_lock;			}
	public int getBo_like() 	   	{		return bo_like;			}
	public int getBook_order() 	   	{		return book_order;		}
	public String getCat_name() 	{		return cat_name;		}
	public int getMem_no() 		   	{		return mem_no;			}
	public int getBook_no() 	   	{		return book_no;			}
	public String getBo_thumbnail() {		return bo_thumbnail;	}
	public String getFind_name()   	{		return find_name;		}
	public String getFind_field()  	{		return find_field;		}
	public String getFind_field2() 	{		return find_field2;		}
	public String getFind_field3() 	{		return find_field3;		}
	public int getStartrow() 		{		return startrow;		}
	public int getEndrow() 			{		return endrow;			}
	public MemberVO getMemberVO() 	{		return memberVO;		}
	public String getBo_color() 	{		return bo_color;		}
	public int getBo_titlespace() 	{		return bo_titlespace;	}
	public BookVO getBookVO() 		{		return bookVO;			}
		
}
