package com.jamong.domain;

/** Database accuse Table Value Object **/
public class AdminVO {
	private String adm_id;
	private String adm_pwd;
	private String adm_name;
	private String adm_phone01;
	private String adm_phone02;
	private String adm_phone03;
	private String adm_email01;
	private String adm_email02;
	private String adm_date;
	
	/* 페이징 변수 */
	private int startrow;
	private int endrow;
	
	/* 검색 변수 */
	private String search_name;
	private String search_field;
	
	/* GETTER() */
	public String getAdm_id() 		{		return adm_id;			}
	public String getAdm_pwd() 		{		return adm_pwd;			}
	public String getAdm_name()		{		return adm_name;		}
	public String getAdm_phone01() 	{		return adm_phone01;		}
	public String getAdm_phone02() 	{		return adm_phone02;		}
	public String getAdm_phone03() 	{		return adm_phone03;		}
	public String getAdm_email01() 	{		return adm_email01;		}
	public String getAdm_email02() 	{		return adm_email02;		}
	public String getAdm_date() 	{		return adm_date;		}
	public int getStartrow() 		{		return startrow;		}
	public int getEndrow() 			{		return endrow;			}
	public String getSearch_name() 	{		return search_name;		}
	public String getSearch_field() {		return search_field;	}
	
	/* SETTER() */
	public void setAdm_id(String adm_id) 			 {		this.adm_id = adm_id;				}
	public void setAdm_pwd(String adm_pwd) 			 {		this.adm_pwd = adm_pwd;				}
	public void setAdm_name(String adm_name) 		 {		this.adm_name = adm_name;			}
	public void setAdm_phone01(String adm_phone01) 	 {		this.adm_phone01 = adm_phone01;		}
	public void setAdm_phone02(String adm_phone02) 	 {		this.adm_phone02 = adm_phone02;		}
	public void setAdm_phone03(String adm_phone03) 	 {		this.adm_phone03 = adm_phone03;		}
	public void setAdm_email01(String adm_email01) 	 {		this.adm_email01 = adm_email01;		}
	public void setAdm_email02(String adm_email02) 	 {		this.adm_email02 = adm_email02;		}
	public void setAdm_date(String adm_date) 		 {		this.adm_date = adm_date;			}
	public void setStartrow(int startrow) 			 {		this.startrow = startrow;			}
	public void setEndrow(int endrow) 				 {		this.endrow = endrow;				}
	public void setSearch_name(String search_name) 	 {		this.search_name = search_name;		}
	public void setSearch_field(String search_field) {		this.search_field = search_field;	}
	
}
