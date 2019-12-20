package com.jamong.domain;

/** Database accuse Table Value Object **/
public class AccuseVO {
	
	private int ac_no;
	private String ac_reason;
	private String ac_cont;
	private String ac_date;
	private int ac_item;
	private int ac_state;
	private int ac_member;
	private int mem_no;
	private int bo_no;
	private int rep_no;
	private String ac_href;
	
	/* 페이징 변수 */
	private int startrow;
	private int endrow;
	
	/* 검색 변수 */
	private String search_name;
	private String search_field;
	private String search_field_item;
	private String search_field_handling;
	private String search_field_info;
	
	
	// Setter()
	public void setAc_no(int ac_no)			   {		this.ac_no = ac_no;				}
	public void setAc_reason(String ac_reason) {		this.ac_reason = ac_reason;		}
	public void setAc_cont(String ac_cont) 	   {		this.ac_cont = ac_cont;			}
	public void setAc_date(String ac_date) 	   {		this.ac_date = ac_date;			}
	public void setAc_item(int ac_item) 	   {		this.ac_item = ac_item;			}
	public void setAc_member(int ac_member)    {		this.ac_member = ac_member;		}
	public void setMem_no(int mem_no) 		   {		this.mem_no = mem_no;			}
	public void setRep_no(int rep_no) 		   {		this.rep_no = rep_no;			}	
	public void setBo_no(int bo_no) 		   {		this.bo_no = bo_no;				}
	public void setSearch_field(String search_field) {	this.search_field = search_field;}
	public void setStartrow(int startrow) {	this.startrow = startrow;}
	public void setEndrow(int endrow) {	this.endrow = endrow;}
	public void setSearch_name(String search_name) {this.search_name = search_name;	}
	public void setAc_state(int ac_state) {	this.ac_state = ac_state;}
	public void setSearch_field_item(String search_field_item) {this.search_field_item = search_field_item;}
	public void setSearch_field_handling(String search_field_handling) {this.search_field_handling = search_field_handling;}
	public void setSearch_field_info(String search_field_info) {this.search_field_info = search_field_info;}
	public void setAc_href(String ac_href) {this.ac_href = ac_href;}
	
	// Getter()
	public int getAc_no() 		 	{		return ac_no;		}
	public String getAc_reason() 	{		return ac_reason;	}
	public String getAc_cont()   	{		return ac_cont;		}
	public String getAc_date()   	{		return ac_date;		}
	public int getAc_item() 	 	{		return ac_item;		}
	public int getAc_member() 	 	{		return ac_member;	}
	public int getMem_no() 		 	{		return mem_no;		}
	public int getBo_no() 		 	{		return bo_no;		}
	public int getRep_no() 		 	{		return rep_no;		}
	public int getStartrow() 	 	{		return startrow;	}
	public int getEndrow() 		 	{		return endrow;		}
	public String getSearch_name()  {		return search_name;	}
	public String getSearch_field() {		return search_field;}
	public int getAc_state() {	return ac_state;	}
	public String getSearch_field_item() {	return search_field_item;}
	public String getSearch_field_handling() {	return search_field_handling;}
	public String getSearch_field_info() {	return search_field_info;}
	public String getAc_href() {return ac_href;}
	
}
