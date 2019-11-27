package com.jamong.domain;

/** Database reply Table Value Object **/
public class ReplyVO {
	
	private int rep_no;
	private String rep_cont;
	private String rep_date;
	private int rep_ref;
	private int rep_step;
	private int rep_level;
	private int bo_no;
	private int mem_no;
	
	// Setter()
	public void setRep_no(int rep_no)		 {		this.rep_no = rep_no;			}
	public void setRep_cont(String rep_cont) {		this.rep_cont = rep_cont;		}
	public void setRep_date(String rep_date) {		this.rep_date = rep_date;		}
	public void setRep_ref(int rep_ref) 	 {		this.rep_ref = rep_ref;			}
	public void setRep_step(int rep_step) 	 {		this.rep_step = rep_step;		}
	public void setRep_level(int rep_level)  {		this.rep_level = rep_level;		}
	public void setBo_no(int bo_no) 		 {		this.bo_no = bo_no;				}
	public void setMem_no(int mem_no) 		 {		this.mem_no = mem_no;			}	
	
	// Getter()
	public int getRep_no() 		{		return rep_no;		}
	public String getRep_cont() {		return rep_cont;	}
	public String getRep_date() {		return rep_date;	}
	public int getRep_ref() 	{		return rep_ref;		}
	public int getRep_step() 	{		return rep_step;	}
	public int getRep_level() 	{		return rep_level;	}
	public int getBo_no() 		{		return bo_no;		}
	public int getMem_no() 		{		return mem_no;		}
	
}
