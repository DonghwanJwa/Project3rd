package com.jamong.domain;

/** Database Category Value Object **/
public class CategoryVO {
	
	private int cat_no;
	private String cat_name;
	
	// Setter()
	public void setCat_no(int cat_no) 		 {		this.cat_no = cat_no;		}
	public void setCat_name(String cat_name) {		this.cat_name = cat_name;	}

	// Getter()
	public int getCat_no() 		{		return cat_no;			}
	public String getCat_name() {		return cat_name;		}
		
}
