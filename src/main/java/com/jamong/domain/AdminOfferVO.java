package com.jamong.domain;

public class AdminOfferVO {

	private int off_no;
	private String off_id;
	private String off_nickname;
	private String off_email;
	private String off_domain;
	private String off_phone1;
	private String off_phone2;
	private String off_phone3;
	private String off_date;
	private String off_item;
	private String off_cont;
	private String off_file1;
	private String off_file2;
	private String off_file3;

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
	private String mem_portfolio;

	/* 페이징 변수 */
	private int startrow;
	private int endrow;

	/* 검색 변수 */
	private String search_name;
	private String search_field1;
	private String search_field2;
	
	// Getter()
	public int getOff_no() 			 {		return off_no;			}
	public String getOff_id() 		 {		return off_id;			}
	public String getOff_nickname()  {		return off_nickname;	}
	public String getOff_email() 	 {		return off_email;		}
	public String getOff_domain() 	 {		return off_domain;		}
	public String getOff_phone1() 	 {		return off_phone1;		}
	public String getOff_phone2() 	 {		return off_phone2;		}
	public String getOff_phone3() 	 {		return off_phone3;		}
	public String getOff_date() 	 {		return off_date;		}
	public String getOff_item() 	 {		return off_item;		}
	public String getOff_cont() 	 {		return off_cont;		}
	public String getOff_file1() 	 {		return off_file1;		}
	public String getOff_file2() 	 {		return off_file2;		}
	public String getOff_file3() 	 {		return off_file3;		}
	public int getMem_no() 			 {		return mem_no;			}
	public String getMem_id() 		 {		return mem_id;			}
	public String getMem_pwd() 		 {		return mem_pwd;			}
	public String getMem_name() 	 {		return mem_name;		}
	public String getMem_birth1() 	 {		return mem_birth1;		}
	public String getMem_birth2() 	 {		return mem_birth2;		}
	public String getMem_birth3() 	 {		return mem_birth3;		}
	public String getEmail_id() 	 {		return email_id;		}
	public String getEmail_domain()  {		return email_domain;	}
	public String getMem_phone01() 	 {		return mem_phone01;		}
	public String getMem_phone02() 	 {		return mem_phone02;		}
	public String getMem_phone03() 	 {		return mem_phone03;		}
	public String getMem_gender() 	 {		return mem_gender;		}
	public String getMem_date() 	 {		return mem_date;		}
	public int getMem_author() 		 {		return mem_author;		}
	public int getMem_state() 		 {		return mem_state;		}
	public String getProfile_photo() {		return profile_photo;	}
	public String getProfile_cont()  {		return profile_cont;	}
	public String getMem_nickname()  {		return mem_nickname;	}
	public String getMem_keyword() 	 {		return mem_keyword;		}
	public String getMem_fav1() 	 {		return mem_fav1;		}
	public String getMem_fav2() 	 {		return mem_fav2;		}
	public String getMem_fav3() 	 {		return mem_fav3;		}
	public String getMem_portfolio() {		return mem_portfolio;	}
	public int getStartrow() 		 {		return startrow;		}
	public int getEndrow() 			 {		return endrow;			}
	public String getSearch_name() 	 {		return search_name;		}
	public String getSearch_field1() {		return search_field1;	}
	public String getSearch_field2() {		return search_field2;	}
	
	// Setter()
	public void setOff_no(int off_no) 				   {		this.off_no = off_no;					}
	public void setOff_id(String off_id) 			   {		this.off_id = off_id;					}
	public void setOff_nickname(String off_nickname)   {		this.off_nickname = off_nickname;		}
	public void setOff_email(String off_email) 		   {		this.off_email = off_email;				}
	public void setOff_domain(String off_domain) 	   {		this.off_domain = off_domain;			}
	public void setOff_phone1(String off_phone1) 	   {		this.off_phone1 = off_phone1;			}
	public void setOff_phone2(String off_phone2) 	   {		this.off_phone2 = off_phone2;			}
	public void setOff_phone3(String off_phone3) 	   {		this.off_phone3 = off_phone3;			}
	public void setOff_date(String off_date) 		   {		this.off_date = off_date;				}
	public void setOff_item(String off_item) 		   {		this.off_item = off_item;				}
	public void setOff_cont(String off_cont) 		   {		this.off_cont = off_cont;				}
	public void setOff_file1(String off_file1) 		   {		this.off_file1 = off_file1;				}
	public void setOff_file2(String off_file2) 		   {		this.off_file2 = off_file2;				}
	public void setOff_file3(String off_file3) 		   {		this.off_file3 = off_file3;				}
	public void setMem_no(int mem_no) 				   {		this.mem_no = mem_no;					}
	public void setMem_id(String mem_id) 			   {		this.mem_id = mem_id;					}
	public void setMem_pwd(String mem_pwd) 			   {		this.mem_pwd = mem_pwd;					}
	public void setMem_name(String mem_name) 		   {		this.mem_name = mem_name;				}
	public void setMem_birth1(String mem_birth1) 	   {		this.mem_birth1 = mem_birth1;			}
	public void setMem_birth2(String mem_birth2) 	   {		this.mem_birth2 = mem_birth2;			}
	public void setMem_birth3(String mem_birth3) 	   {		this.mem_birth3 = mem_birth3;			}
	public void setEmail_id(String email_id) 		   {		this.email_id = email_id;				}
	public void setEmail_domain(String email_domain)   {		this.email_domain = email_domain;		}
	public void setMem_phone01(String mem_phone01) 	   {		this.mem_phone01 = mem_phone01;			}
	public void setMem_phone02(String mem_phone02) 	   {		this.mem_phone02 = mem_phone02;			}
	public void setMem_phone03(String mem_phone03) 	   {		this.mem_phone03 = mem_phone03;			}
	public void setMem_gender(String mem_gender) 	   {		this.mem_gender = mem_gender;			}
	public void setMem_date(String mem_date) 		   {		this.mem_date = mem_date;				}
	public void setMem_author(int mem_author) 		   {		this.mem_author = mem_author;			}
	public void setMem_state(int mem_state) 		   {		this.mem_state = mem_state;				}
	public void setProfile_photo(String profile_photo) {		this.profile_photo = profile_photo;		}
	public void setProfile_cont(String profile_cont)   {		this.profile_cont = profile_cont;		}
	public void setMem_nickname(String mem_nickname)   {		this.mem_nickname = mem_nickname;		}
	public void setMem_keyword(String mem_keyword) 	   {		this.mem_keyword = mem_keyword;			}
	public void setMem_fav1(String mem_fav1) 		   {		this.mem_fav1 = mem_fav1;				}
	public void setMem_fav2(String mem_fav2) 		   {		this.mem_fav2 = mem_fav2;				}
	public void setMem_fav3(String mem_fav3) 		   {		this.mem_fav3 = mem_fav3;				}
	public void setMem_portfolio(String mem_portfolio) {		this.mem_portfolio = mem_portfolio;		}
	public void setStartrow(int startrow) 			   {		this.startrow = startrow;				}
	public void setEndrow(int endrow) 				   {		this.endrow = endrow;					}
	public void setSearch_name(String search_name) 	   {		this.search_name = search_name;			}
	public void setSearch_field1(String search_field1) {		this.search_field1 = search_field1;		}
	public void setSearch_field2(String search_field2) {		this.search_field2 = search_field2;		}

}
