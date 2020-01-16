package com.jamong.domain;

/** DATABASE VISIT TABLE VALUE OBJECT **/
public class VisitVO {
	
	private int visit_no;
	private String visit_date;
	private int count;
	
	// Setter()
	public void setVisit_no(int visit_no) 		 {		this.visit_no = visit_no;			}
	public void setVisit_date(String visit_date) {		this.visit_date = visit_date;		}
	public void setCount(int count) 			 {		this.count = count;					}

	// Getter()
	public int getVisit_no() 	  {		return visit_no;		}
	public String getVisit_date() {		return visit_date;		}	
	public int getCount() 		  {		return count;			}
}
