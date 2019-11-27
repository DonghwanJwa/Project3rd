package com.jamong.domain;

/** Database offer Table Value Object **/
public class OfferVO {

	private int off_no;
	private String off_date;
	private String off_item;
	private String off_cont;
	private String off_file1;
	private String off_file2;
	private String off_file3;
	private String off_file4;
	private String off_file5;
	private int off_id;
	private int mem_no;
	
	// Setter()
	public void setOff_no(int off_no) 		   {		this.off_no = off_no;			}
	public void setOff_date(String off_date)   {		this.off_date = off_date;		}
	public void setOff_item(String off_item)   {		this.off_item = off_item;		}
	public void setOff_cont(String off_cont)   {		this.off_cont = off_cont;		}
	public void setOff_file1(String off_file1) {		this.off_file1 = off_file1;		}
	public void setOff_file2(String off_file2) {		this.off_file2 = off_file2;		}
	public void setOff_file3(String off_file3) {		this.off_file3 = off_file3;		}
	public void setOff_file4(String off_file4) {		this.off_file4 = off_file4;		}
	public void setOff_file5(String off_file5) {		this.off_file5 = off_file5;		}
	public void setOff_id(int off_id) 		   {		this.off_id = off_id;			}
	public void setMem_no(int mem_no) 		   {		this.mem_no = mem_no;			}
	
	// Getter()
	public int getOff_no() 		 {		return off_no;		}
	public String getOff_date()  {		return off_date;	}
	public String getOff_item()  {		return off_item;	}
	public String getOff_cont()  {		return off_cont;	}
	public String getOff_file1() {		return off_file1;	}
	public String getOff_file2() {		return off_file2;	}
	public String getOff_file3() {		return off_file3;	}
	public String getOff_file4() {		return off_file4;	}
	public String getOff_file5() {		return off_file5;	}
	public int getOff_id() 		 {		return off_id;		}
	public int getMem_no() 		 {		return mem_no;		}
	
}
