package com.jamong.domain;

/** Database subscribe Table Value Object **/
public class SubscribeVO {

	private int sub_no;
	private int sub_member;
	private int mem_no;
	
	// Setter()
	public void setSub_no(int sub_no) 		  {		this.sub_no = sub_no;			}
	public void setSub_member(int sub_member) {		this.sub_member = sub_member;	}
	public void setMem_no(int mem_no) 		  {		this.mem_no = mem_no;			}	
	
	// Getter()
	public int getSub_no()	   {		return sub_no;			}
	public int getSub_member() {		return sub_member;		}
	public int getMem_no() 	   {		return mem_no;			}
}
