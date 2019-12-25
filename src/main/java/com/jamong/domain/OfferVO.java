package com.jamong.domain;

/** Database offer Table Value Object **/
public class OfferVO {

	private int off_no;
	private String off_id;
	private String off_email;
	private String off_domain;
	private String off_phone1;
	private String off_phone2;
	private String off_phone3;
	private String off_date;
	private String off_item;
	private String off_cont;
	private String off_file1;
	private String off_file2;
	private String off_file3;
	private int mem_no;
	
	/* 페이징 변수 */
	private int startrow;
	private int endrow;
	
	/* 검색 변수 */
	private String search_name;
	private String search_field1;
	private String search_field2;
	
	private MemberVO memberVO; // 조인검색을 위한 MemberVO 변수 선언

	public int getOff_no() 				{		return off_no;			}
	public String getOff_id() 			{		return off_id;			}
	public String getOff_email() 		{		return off_email;		}
	public String getOff_domain() 		{		return off_domain;		}
	public String getOff_phone1() 			{		return off_phone1;			}
	public String getOff_phone2() 			{		return off_phone2;			}
	public String getOff_phone3() 			{		return off_phone3;			}
	public String getOff_date() 		{		return off_date;		}
	public String getOff_item() 		{		return off_item;		}
	public String getOff_cont() 		{		return off_cont;		}
	public String getOff_file1() 		{		return off_file1;		}
	public String getOff_file2() 		{		return off_file2;		}
	public String getOff_file3() 		{		return off_file3;		}
	public int getMem_no() 				{		return mem_no;			}
	public int getStartrow() 			{		return startrow;		}
	public int getEndrow() 				{		return endrow;			}
	public String getSearch_name() 		{		return search_name;		}
	public String getSearch_field1() 	{		return search_field1;	}
	public String getSearch_field2() 	{		return search_field2;	}
	public MemberVO getMemberVO() 		{		return memberVO;		}
	
	public void setOff_no(int off_no) 				{		this.off_no = off_no;			}
	public void setOff_id(String off_id) 			{		this.off_id = off_id;			}
	public void setOff_email(String off_email) 		{		this.off_email = off_email;		}
	public void setOff_domain(String off_domain) 	{		this.off_domain = off_domain;	}
	public void setOff_phone1(String off_phone1) 			{		this.off_phone1 = off_phone1;			}
	public void setOff_phone2(String off_phone2) 			{		this.off_phone2 = off_phone2;			}
	public void setOff_phone3(String off_phone3) 			{		this.off_phone3 = off_phone3;			}
	public void setOff_date(String off_date) 		{		this.off_date = off_date;		}
	public void setOff_item(String off_item) 		{		this.off_item = off_item;		}
	public void setOff_cont(String off_cont) 		{		this.off_cont = off_cont;		}
	public void setOff_file1(String off_file1) 		{		this.off_file1 = off_file1;		}
	public void setOff_file2(String off_file2) 		{		this.off_file2 = off_file2;		}
	public void setOff_file3(String off_file3) 		{		this.off_file3 = off_file3;		}
	public void setMem_no(int mem_no) 				{		this.mem_no = mem_no;			}
	public void setStartrow(int startrow) 			{		this.startrow = startrow;		}
	public void setEndrow(int endrow) 				{		this.endrow = endrow;			}
	public void setSearch_name(String search_name) 	{		this.search_name = search_name;	}
	public void setSearch_field1(String search_field1)  {		this.search_field1 = search_field1;	}
	public void setSearch_field2(String search_field2)  {		this.search_field2 = search_field2;	}
	public void setMemberVO(MemberVO memberVO) 			{		this.memberVO = memberVO;	}
	
}
