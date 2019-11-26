package com.jamong.domain;

/** Database sympathy Table Value Object **/
public class SympathyVO {
	
	private int sym_no;
	private int bo_no;
	private int mem_no;
	
	// Setter()
	public void setSym_no(int sym_no) {		this.sym_no = sym_no;	}
	public void setBo_no(int bo_no)	  {		this.bo_no = bo_no;		}
	public void setMem_no(int mem_no) {		this.mem_no = mem_no;	}

	// Getter()
	public int getSym_no() {		return sym_no;		}
	public int getBo_no()  {		return bo_no;		}
	public int getMem_no() {		return mem_no;		}
	
}
