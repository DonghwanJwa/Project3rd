package com.jamong.domain;

public class NoticeVO {
	private int noti_no;
	private String noti_title;
	private String noti_name;
	private String noti_pwd;
	private String noti_cont;
	private int noti_hit;
	private String noti_date;
	
	/* 페이징 변수 */
	private int startrow;
	private int endrow;
	
	/* 검색 변수 */
	private String search_name;
	private String search_field;
	
	public int getNoti_no() 		{		return noti_no;			}
	public String getNoti_title() 	{		return noti_title;		}
	public String getNoti_name() 	{		return noti_name;		}
	public String getNoti_pwd() 	{		return noti_pwd;		}
	public String getNoti_cont() 	{		return noti_cont;		}
	public int getNoti_hit() 		{		return noti_hit;		}
	public String getNoti_date() 	{		return noti_date;		}
	public int getStartrow() 		{		return startrow;		}
	public int getEndrow() 			{		return endrow;			}
	public String getSearch_name() 	{		return search_name;		}
	public String getSearch_field() {		return search_field;	}
	
	public void setNoti_no(int noti_no) 				{		this.noti_no = noti_no;				}
	public void setNoti_title(String noti_title) 		{		this.noti_title = noti_title;		}
	public void setNoti_name(String noti_name) 			{		this.noti_name = noti_name;			}
	public void setNoti_pwd(String noti_pwd) 			{		this.noti_pwd = noti_pwd;			}
	public void setNoti_cont(String noti_cont) 			{		this.noti_cont = noti_cont;			}
	public void setNoti_hit(int noti_hit) 				{		this.noti_hit = noti_hit;			}
	public void setNoti_date(String noti_date) 			{		this.noti_date = noti_date;			}
	public void setStartrow(int startrow) 				{		this.startrow = startrow;			}
	public void setEndrow(int endrow) 					{		this.endrow = endrow;				}
	public void setSearch_name(String search_name) 		{		this.search_name = search_name;		}
	public void setSearch_field(String search_field) 	{		this.search_field = search_field;	}
	
	
}
