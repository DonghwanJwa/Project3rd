package com.jamong.domain;

/** Database inquire Table Value Object **/
public class InquireVO {

	private int inq_no;
	private String inq_item;
	private String inq_phone;
	private String inq_cont;
	private String inq_email;
	private String inq_file1;
	private String inq_file2;
	private String inq_file3;
	private String inq_file4;
	private int inq_state;
	private String inq_date;
	private int mem_no;
	private String inq_reply;
	private String inq_sender;
	private String inq_replydate;
	
	/* 페이징 변수 */
	private int startrow;
	private int endrow;
	
	/* 검색 변수 */
	private String search_field_item;
	private String search_field;
	private String search_field_handling;
	private String search_field_info;
	private String search_name;
	
	private MemberVO memberVO;
	
	// Setter()
	public void setInq_no(int inq_no) 		   							{		this.inq_no = inq_no;								}
	public void setInq_item(String inq_item)   							{		this.inq_item = inq_item;							}
	public void setInq_phone(String inq_phone) 							{		this.inq_phone = inq_phone;							}
	public void setInq_cont(String inq_cont)   							{		this.inq_cont = inq_cont;							}
	public void setInq_email(String inq_email) 							{		this.inq_email = inq_email;							}
	public void setInq_file1(String inq_file1) 							{		this.inq_file1 = inq_file1;							}
	public void setInq_file2(String inq_file2) 							{		this.inq_file2 = inq_file2;							}
	public void setInq_file3(String inq_file3) 							{		this.inq_file3 = inq_file3;							}
	public void setInq_file4(String inq_file4) 							{		this.inq_file4 = inq_file4;							}
	public void setInq_date(String inq_date)   							{		this.inq_date = inq_date;							}
	public void setInq_state(int inq_state)    							{		this.inq_state = inq_state; 						}
	public void setMem_no(int mem_no) 		   							{		this.mem_no = mem_no;								}
	public void setStartrow(int startrow) 	   							{		this.startrow = startrow;							}
	public void setEndrow(int endrow) 		   							{		this.endrow = endrow;								}
	public void setMemberVO(MemberVO memberVO) 							{		this.memberVO = memberVO;							}
	public void setInq_reply(String inq_reply) 							{		this.inq_reply = inq_reply;							}
	public void setInq_sender(String inq_sender) 						{		this.inq_sender = inq_sender;						}
	public void setInq_replydate(String inq_replydate) 					{		this.inq_replydate = inq_replydate;					}
	public void setSearch_field(String search_field) 					{		this.search_field = search_field;					}
	public void setSearch_field_item(String search_field_item) 			{		this.search_field_item = search_field_item;			}
	public void setSearch_field_handling(String search_field_handling) 	{		this.search_field_handling = search_field_handling;	}
	public void setSearch_field_info(String search_field_info) 			{		this.search_field_info = search_field_info;			}
	public void setSearch_name(String search_name) 						{		this.search_name = search_name;						}
	
	// Getter()
	public int getInq_no() 						{		return inq_no;					}
	public String getInq_item() 				{		return inq_item;				}
	public String getInq_phone() 				{		return inq_phone;				}
	public String getInq_cont()  				{		return inq_cont;				}
	public String getInq_email() 				{		return inq_email;				}
	public String getInq_file1() 				{		return inq_file1;				}
	public String getInq_file2() 				{		return inq_file2;				}
	public String getInq_file3() 				{		return inq_file3;				}
	public String getInq_file4() 				{		return inq_file4;				}
	public String getInq_date()  				{		return inq_date;				}
	public int getMem_no() 		 				{		return mem_no;					}
	public int getStartrow() 					{		return startrow;				}
	public int getEndrow() 						{		return endrow;					}
	public int getInq_state() 					{		return inq_state;				}
	public MemberVO getMemberVO() 				{		return memberVO;				}
	public String getInq_reply() 				{		return inq_reply;				}
	public String getInq_sender() 				{		return inq_sender;				}
	public String getInq_replydate() 			{		return inq_replydate;			}
	public String getSearch_field() 			{		return search_field;			}
	public String getSearch_field_item() 		{		return search_field_item;		}
	public String getSearch_field_handling() 	{		return search_field_handling;	}
	public String getSearch_field_info() 		{		return search_field_info;		}
	public String getSearch_name() 				{		return search_name;				}
	
}
