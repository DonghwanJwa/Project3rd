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
	private int bo_lock;
	private int bo_type;
	private int bo_like;
	private int book_order;
	private int cat_no;
	private int mem_no;
	private int book_no;
	
	private String find_name;
	private String find_field;
	
	private MemberVO memberVO;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	// Setter()
	public void setBo_date(String bo_date)		   	 {		this.bo_date = bo_date;				}
	public void setBo_editdate(String bo_editdate) 	 {		this.bo_editdate = bo_editdate;		}
	public void setBo_lock(int bo_lock) 		   	 {		this.bo_lock = bo_lock;				}
	public void setBo_like(int bo_like) 		   	 {		this.bo_like = bo_like;				}
	public void setBook_order(int book_order) 	   	 {		this.book_order = book_order;		}
	public void setCat_no(int cat_no) 			   	 {		this.cat_no = cat_no;				}
	public void setMem_no(int mem_no) 			   	 {		this.mem_no = mem_no;				}
	public void setBook_no(int book_no) 		     {		this.book_no = book_no;				}
	public void setBo_no(int bo_no) 			   	 {		this.bo_no = bo_no;					}
	public void setBo_title(String bo_title) 	   	 {		this.bo_title = bo_title;			}
	public void setBo_subtitle(String bo_subtitle) 	 {		this.bo_subtitle = bo_subtitle;		}
	public void setBo_cont(String bo_cont) 		   	 {		this.bo_cont = bo_cont;				}
	public void setBo_hit(int bo_hit) 			  	 {		this.bo_hit = bo_hit;				}
	public void setBo_thumbnail(String bo_thumbnail) {		this.bo_thumbnail = bo_thumbnail;	}
	public void setBo_type(int bo_type) 			 {		this.bo_type = bo_type;				}
	public void setFind_field(String find_field)   	 {		this.find_field = find_field;		}
	public void setFind_name(String find_name) 	   	 {		this.find_name = find_name;			}
	
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
	public int getCat_no() 		   	{		return cat_no;			}
	public int getMem_no() 		   	{		return mem_no;			}
	public int getBook_no() 	   	{		return book_no;			}
	public String getBo_thumbnail() {		return bo_thumbnail;	}
	public int getBo_type() 		{		return bo_type;			}
	public String getFind_name()   	{		return find_name;		}
	public String getFind_field()  	{		return find_field;		}
		
}
