package com.jamong.domain;

/** Database favorite Value Object **/
public class FavoriteVO {
	
	private int fav_no;
	private String fav_name;
	
	// Setter()
	public void setFav_no(int fav_no) 		 {		this.fav_no = fav_no;		}
	public void setFav_name(String fav_name) {		this.fav_name = fav_name;	}

	// Getter()
	public int getFav_no() 		{		return fav_no;			}
	public String getFav_name() {		return fav_name;		}
		
}
