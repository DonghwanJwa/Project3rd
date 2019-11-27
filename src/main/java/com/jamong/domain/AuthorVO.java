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
	private int mem_no;
	
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
	public void setMem_no(int mem_no) 		   {		this.mem_no = mem_no;			}

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
	public int getMem_no() 		 {		return mem_no;		}
	
}
