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
	private String mem_portflio; // 12/03 회원 테이블 수정 후 VO에 추가 (getter,setter)
	
	// Setter
	public void setMem_no(int mem_no) 				   {			this.mem_no = mem_no;					}
	public void setMem_id(String mem_id) 			   {			this.mem_id = mem_id;					}
	public void setMem_pwd(String mem_pwd) 			   {			this.mem_pwd = mem_pwd;					}
	public void setMem_name(String mem_name) 		   {			this.mem_name = mem_name;				}
	public void setMem_birth1(String mem_birth1) 	   {			this.mem_birth1 = mem_birth1;			}
	public void setMem_birth2(String mem_birth2) 	   {			this.mem_birth2 = mem_birth2;			}
	public void setMem_birth3(String mem_birth3) 	   {			this.mem_birth3 = mem_birth3;			}
	public void setEmail_id(String email_id) 		   {			this.email_id = email_id;				}
	public void setEmail_domain(String email_domain)   {			this.email_domain = email_domain;		}
	public void setMem_phone01(String mem_phone01) 	   {			this.mem_phone01 = mem_phone01;			}
	public void setMem_phone02(String mem_phone02) 	   {			this.mem_phone02 = mem_phone02;			}
	public void setMem_phone03(String mem_phone03) 	   {			this.mem_phone03 = mem_phone03;			}
	public void setMem_gender(String mem_gender)	   {			this.mem_gender = mem_gender;			}			
	public void setMem_date(String mem_date) 	 	   {			this.mem_date = mem_date;				}
	public void setMem_author(int mem_author) 		   {			this.mem_author = mem_author;			}
	public void setMem_state(int mem_state) 		   {			this.mem_state = mem_state;				}
	public void setProfile_photo(String profile_photo) {			this.profile_photo = profile_photo;		}
	public void setProfile_cont(String profile_cont)   {			this.profile_cont = profile_cont;		}
	public void setMem_nickname(String mem_nickname)   {			this.mem_nickname = mem_nickname;		}
	public void setMem_keyword(String mem_keyword) 	   {			this.mem_keyword = mem_keyword;			}
	public void setMem_fav1(String mem_fav1) 		   {			this.mem_fav1 = mem_fav1;				}
	public void setMem_fav2(String mem_fav2) 		   {			this.mem_fav2 = mem_fav2;				}
	public void setMem_fav3(String mem_fav3) 		   {			this.mem_fav3 = mem_fav3;				}
	public void setMem_portflio(String mem_portflio)   {			this.mem_portflio = mem_portflio;		}
	
	// Getter()
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
	public String getMem_portflio()  {		return mem_portflio;	}
	
}
