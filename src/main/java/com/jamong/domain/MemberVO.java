package com.jamong.domain;

/** Database member Table Value Object **/
public class MemberVO {
	
	private int mem_no;
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_birth1;
	private String mem_birth2;
	private String mem_birth3;
	private String email_id;
	private String email_domain;
	private String mem_phone01;
	private String mem_phone02;
	private String mem_phone03;	
	private String mem_gender;	
	private String mem_date;	
	private int mem_author;	
	private int mem_state;	
	private String profile_photo;	
	private String profile_cont;
	private String mem_nickname;
	private String mem_keyword;
	private String mem_fav1;
	private String mem_fav2;
	private String mem_fav3;
	private String mem_portfolio; // 12/03 회원 테이블 수정 후 VO에 추가 (getter,setter)
	/* 12/26 탈퇴사유, 날짜 추가 */
	private String drop_reason;
	private String drop_cont;
	private int mem_article;
	private int mem_subscribe;
	private String drop_date;
	private String age_group;
	private int count;

	public int getCount() {		return count;	}
	public void setCount(int count) {		this.count = count;	}
	public String getAge_group() {		return age_group;	}
	public void setAge_group(String age_group) {		this.age_group = age_group;	}
	
	/* 관리자페이지 회원관리 게시판 페이징,검색을 위한 변수 추가 (12/5) */
	private int startrow;
	private int endrow;
	private String search_name;
	private String search_field_state;
	private String search_field_author;
	private String search_field_key;
	/*프로필 내용을 가져오기 위한 BoardVO, MemberVO 추가(12/16)*/
	
	// Setter
	public void setMem_no(int mem_no) 				   				{			this.mem_no = mem_no;								}
	public void setMem_id(String mem_id) 			  				{			this.mem_id = mem_id;								}
	public void setMem_pwd(String mem_pwd) 			  				{			this.mem_pwd = mem_pwd;								}
	public void setMem_name(String mem_name) 		  				{			this.mem_name = mem_name;							}
	public void setMem_birth1(String mem_birth1) 	  				{			this.mem_birth1 = mem_birth1;						}
	public void setMem_birth2(String mem_birth2) 	  				{			this.mem_birth2 = mem_birth2;						}
	public void setMem_birth3(String mem_birth3) 	  				{			this.mem_birth3 = mem_birth3;						}
	public void setEmail_id(String email_id) 		  				{			this.email_id = email_id;							}
	public void setEmail_domain(String email_domain)   				{			this.email_domain = email_domain;					}
	public void setMem_phone01(String mem_phone01) 	   				{			this.mem_phone01 = mem_phone01;						}
	public void setMem_phone02(String mem_phone02) 	  				{			this.mem_phone02 = mem_phone02;						}
	public void setMem_phone03(String mem_phone03) 	   				{			this.mem_phone03 = mem_phone03;						}
	public void setMem_gender(String mem_gender)	   				{			this.mem_gender = mem_gender;						}				
	public void setMem_date(String mem_date) 	 	   				{			this.mem_date = mem_date;							}
	public void setMem_author(int mem_author) 		   				{			this.mem_author = mem_author;						}
	public void setMem_state(int mem_state) 		   				{			this.mem_state = mem_state;							}
	public void setProfile_photo(String profile_photo)				{			this.profile_photo = profile_photo;					}
	public void setProfile_cont(String profile_cont)   				{			this.profile_cont = profile_cont;					}
	public void setMem_nickname(String mem_nickname)   				{			this.mem_nickname = mem_nickname;					}
	public void setMem_keyword(String mem_keyword) 	   				{			this.mem_keyword = mem_keyword;						}
	public void setMem_fav1(String mem_fav1) 		   				{			this.mem_fav1 = mem_fav1;							}
	public void setMem_fav2(String mem_fav2) 		   				{			this.mem_fav2 = mem_fav2;							}
	public void setMem_fav3(String mem_fav3) 		   				{			this.mem_fav3 = mem_fav3;							}
	public void setMem_portfolio(String mem_portfolio) 				{			this.mem_portfolio = mem_portfolio;					}
	public void setStartrow(int startrow)							{			this.startrow = startrow;							}
	public void setEndrow(int endrow) 								{			this.endrow = endrow;								}
	public void setSearch_name(String search_name) 					{			this.search_name = search_name;						}
	public void setSearch_field_state(String search_field_state) 	{			this.search_field_state = search_field_state;		}
	public void setSearch_field_author(String search_field_author) 	{			this.search_field_author = search_field_author;		}
	public void setSearch_field_key(String search_field_key) 		{			this.search_field_key = search_field_key;			}	
	public void setDrop_reason(String drop_reason) 					{			this.drop_reason = drop_reason;						}
	public void setDrop_date(String drop_date) 						{			this.drop_date = drop_date;							}
	public void setMem_article(int mem_article) 					{			this.mem_article = mem_article;						}
	public void setMem_subscribe(int mem_subscribe) 				{			this.mem_subscribe = mem_subscribe;					}
	public void setDrop_cont(String drop_cont) 						{			this.drop_cont = drop_cont;							}
	
	
	// Getter()
	public int getMem_no() 					{			return mem_no;					}
	public String getMem_id() 				{			return mem_id;					}
	public String getMem_pwd() 				{			return mem_pwd;					}
	public String getMem_name() 	 		{			return mem_name;				}
	public String getMem_birth1() 	 		{			return mem_birth1;				}
	public String getMem_birth2() 	 		{			return mem_birth2;				}
	public String getMem_birth3() 	 		{			return mem_birth3;				}
	public String getEmail_id() 			{			return email_id;				}
	public String getEmail_domain() 		{			return email_domain;			}
	public String getMem_phone01() 			{			return mem_phone01;				}
	public String getMem_phone02() 			{			return mem_phone02;				}
	public String getMem_phone03() 			{			return mem_phone03;				}
	public String getMem_gender() 			{			return mem_gender;				}
	public String getMem_date() 			{			return mem_date;				}
	public int getMem_author() 				{			return mem_author;				}
	public int getMem_state() 		 		{			return mem_state;				}
	public String getProfile_photo()		{			return profile_photo;			}
	public String getProfile_cont()  		{			return profile_cont;			}
	public String getMem_nickname()  		{			return mem_nickname;			}
	public String getMem_keyword() 	 		{			return mem_keyword;				}
	public String getMem_fav1() 			{			return mem_fav1;				}
	public String getMem_fav2() 			{			return mem_fav2;				}
	public String getMem_fav3() 			{				return mem_fav3;			}
	public String getMem_portfolio() 		{			return mem_portfolio;			}
	public int getStartrow() 				{			return startrow;				}
	public int getEndrow() 			 		{			return endrow;					}
	public String getSearch_name() 	 		{			return search_name;				}
	public String getSearch_field_state() 	{			return search_field_state;		}
	public String getSearch_field_author() 	{			return search_field_author;		}
	public String getSearch_field_key() 	{			return search_field_key;		}
	public String getDrop_reason() 			{			return drop_reason;				}
	public String getDrop_date() 			{			return drop_date;				}
	public int getMem_article() 			{			return mem_article;				}
	public int getMem_subscribe() 			{			return mem_subscribe;			}
	public String getDrop_cont() 			{			return drop_cont;				}
	
}
