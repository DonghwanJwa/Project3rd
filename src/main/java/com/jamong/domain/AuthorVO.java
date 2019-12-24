package com.jamong.domain;

/** Database author Table Value Object **/
public class AuthorVO {
	
	private int aut_no;
	private String aut_intro;
	private String aut_plan;
	private String aut_url1;
	private String aut_url2;
	private String aut_url3;
	private String aut_file1;
	private String aut_file2;
	private String aut_file3;
	private String aut_date;
	private int aut_state;
	private String aut_update;
	
	/* 회원 세션값 받아올 변수 */
	private int mem_no;
	
	/* 페이징 변수 */
	private int startrow;
	private int endrow;
	
	/* 검색 변수 */
	private String search_name;
	private String search_field1;
	private String search_field2;
	
	private MemberVO memberVO; // 조인검색을 위한 MemberVO 변수 선언
	
	// Setter()
	public void setAut_no(int aut_no)		   {		this.aut_no = aut_no;			}
	public void setAut_intro(String aut_intro) {		this.aut_intro = aut_intro;		}
	public void setAut_plan(String aut_plan)   {		this.aut_plan = aut_plan;		}
	public void setAut_url1(String aut_url1)   {		this.aut_url1 = aut_url1;		}
	public void setAut_url2(String aut_url2)   {		this.aut_url2 = aut_url2;		}
	public void setAut_url3(String aut_url3)   {  		this.aut_url3 = aut_url3;		}
	public void setAut_file1(String aut_file1) {		this.aut_file1 = aut_file1;		}
	public void setAut_file2(String aut_file2) {		this.aut_file2 = aut_file2;		}
	public void setAut_file3(String aut_file3) {		this.aut_file3 = aut_file3;		}
	public void setAut_date(String aut_date)   {		this.aut_date = aut_date;		}
	public void setAut_state(int aut_state) {		this.aut_state = aut_state;	}
	public void setAut_update(String aut_update) {		this.aut_update = aut_update;	}
	public void setMem_no(int mem_no) 		   {		this.mem_no = mem_no;			}
	public void setStartrow(int startrow)		{		this.startrow = startrow;	}
	public void setEndrow(int endrow) 			{		this.endrow = endrow;	}
	public void setSearch_name(String search_name) {		this.search_name = search_name;	}
	public void setSearch_field1(String search_field1) {		this.search_field1 = search_field1;	}
	public void setSearch_field2(String search_field2) {		this.search_field1 = search_field2;	}
	public void setMemberVO(MemberVO memberVO) {		this.memberVO = memberVO;	}

	// Getter()
	public int getAut_no() 		 {		return aut_no;		}
	public String getAut_intro() {		return aut_intro;	}
	public String getAut_plan()  {		return aut_plan;	}
	public String getAut_url1()  {		return aut_url1;	}
	public String getAut_url2()  {		return aut_url2;	}
	public String getAut_url3()  {		return aut_url3;	}
	public String getAut_file1() {		return aut_file1;	}
	public String getAut_file2() {		return aut_file2;	}
	public String getAut_file3() {		return aut_file3;	}
	public String getAut_date()  {		return aut_date;	}
	public int getAut_state() {		return aut_state;	}
	public String getAut_update() {		return aut_update;	}
	public int getMem_no() 		 {		return mem_no;		}
	public int getStartrow()	 {		return startrow;	}
	public int getEndrow()		 {		return endrow;		}
	public String getSearch_name() {		return search_name;	}
	public String getSearch_field1() {		return search_field1;	}
	public String getSearch_field2() {		return search_field2;	}
	public MemberVO getMemberVO() {		return memberVO;	}
	
}
