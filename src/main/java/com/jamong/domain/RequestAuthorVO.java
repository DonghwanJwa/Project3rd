package com.jamong.domain;

/* 작가신청 : author, member 조인 VO */
public class RequestAuthorVO {
	private int aut_no;
	private String aut_intro;
	private String aut_plan;
	private String aut_url1;
	private String aut_url2;
	private String aut_url3;
	private String aut_file1;
	private String aut_file2;
	private String aut_file3;
	private String aut_date;
	private String aut_state;
	private String aut_update;
	
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
	
	public int getAut_no() {		return aut_no;	}
	public String getAut_intro() {		return aut_intro;	}
	public String getAut_plan() {		return aut_plan;	}
	public String getAut_url1() {		return aut_url1;	}
	public String getAut_url2() {		return aut_url2;	}
	public String getAut_url3() {		return aut_url3;	}
	public String getAut_file1() {		return aut_file1;	}
	public String getAut_file2() {		return aut_file2;	}
	public String getAut_file3() {		return aut_file3;	}
	public String getAut_date() {		return aut_date;	}
	public String getAut_state() {		return aut_state;	}
	public String getAut_update() {		return aut_update;	}
	public int getMem_no() {		return mem_no;	}
	public String getMem_id() {		return mem_id;	}
	public String getMem_pwd() {		return mem_pwd;	}
	public String getMem_name() {		return mem_name;	}
	public String getMem_birth1() {		return mem_birth1;	}
	public String getMem_birth2() {		return mem_birth2;	}
	public String getMem_birth3() {		return mem_birth3;	}
	public String getEmail_id() {		return email_id;	}
	public String getEmail_domain() {		return email_domain;	}
	public String getMem_phone01() {		return mem_phone01;	}
	public String getMem_phone02() {		return mem_phone02;	}
	public String getMem_phone03() {		return mem_phone03;	}
	public String getMem_gender() {		return mem_gender;	}
	public String getMem_date() {		return mem_date;	}
	public int getMem_author() {		return mem_author;	}
	public int getMem_state() {		return mem_state;	}
	public String getProfile_photo() {		return profile_photo;	}
	public String getProfile_cont() {		return profile_cont;	}
	public String getMem_nickname() {		return mem_nickname;	}
	public String getMem_keyword() {		return mem_keyword;	}
	public String getMem_fav1() {		return mem_fav1;	}
	public String getMem_fav2() {		return mem_fav2;	}
	public String getMem_fav3() {		return mem_fav3;	}
	public String getMem_portfolio() {		return mem_portfolio;	}
	public int getStartrow() {		return startrow;	}
	public int getEndrow() {		return endrow;	}
	public String getSearch_name() {		return search_name;	}
	public String getSearch_field1() {		return search_field1;	}
	public String getSearch_field2() {		return search_field2;	}
	public void setAut_no(int aut_no) {		this.aut_no = aut_no;	}
	public void setAut_intro(String aut_intro) {		this.aut_intro = aut_intro;	}
	public void setAut_plan(String aut_plan) {		this.aut_plan = aut_plan;	}
	public void setAut_url1(String aut_url1) {		this.aut_url1 = aut_url1;	}
	public void setAut_url2(String aut_url2) {		this.aut_url2 = aut_url2;	}
	public void setAut_url3(String aut_url3) {		this.aut_url3 = aut_url3;	}
	public void setAut_file1(String aut_file1) {		this.aut_file1 = aut_file1;	}
	public void setAut_file2(String aut_file2) {		this.aut_file2 = aut_file2;	}
	public void setAut_file3(String aut_file3) {		this.aut_file3 = aut_file3;	}
	public void setAut_date(String aut_date) {		this.aut_date = aut_date;	}
	public void setAut_state(String aut_state) {		this.aut_state = aut_state;	}
	public void setAut_update(String aut_update) {		this.aut_update = aut_update;	}
	public void setMem_no(int mem_no) {		this.mem_no = mem_no;	}
	public void setMem_id(String mem_id) {		this.mem_id = mem_id;	}
	public void setMem_pwd(String mem_pwd) {		this.mem_pwd = mem_pwd;	}
	public void setMem_name(String mem_name) {		this.mem_name = mem_name;	}
	public void setMem_birth1(String mem_birth1) {		this.mem_birth1 = mem_birth1;	}
	public void setMem_birth2(String mem_birth2) {		this.mem_birth2 = mem_birth2;	}
	public void setMem_birth3(String mem_birth3) {		this.mem_birth3 = mem_birth3;	}
	public void setEmail_id(String email_id) {		this.email_id = email_id;	}
	public void setEmail_domain(String email_domain) {		this.email_domain = email_domain;	}
	public void setMem_phone01(String mem_phone01) {		this.mem_phone01 = mem_phone01;	}
	public void setMem_phone02(String mem_phone02) {		this.mem_phone02 = mem_phone02;	}
	public void setMem_phone03(String mem_phone03) {		this.mem_phone03 = mem_phone03;	}
	public void setMem_gender(String mem_gender) {		this.mem_gender = mem_gender;	}
	public void setMem_date(String mem_date) {		this.mem_date = mem_date;	}
	public void setMem_author(int mem_author) {		this.mem_author = mem_author;	}
	public void setMem_state(int mem_state) {		this.mem_state = mem_state;	}
	public void setProfile_photo(String profile_photo) {		this.profile_photo = profile_photo;	}
	public void setProfile_cont(String profile_cont) {		this.profile_cont = profile_cont;	}
	public void setMem_nickname(String mem_nickname) {		this.mem_nickname = mem_nickname;	}
	public void setMem_keyword(String mem_keyword) {		this.mem_keyword = mem_keyword;	}
	public void setMem_fav1(String mem_fav1) {		this.mem_fav1 = mem_fav1;	}
	public void setMem_fav2(String mem_fav2) {		this.mem_fav2 = mem_fav2;	}
	public void setMem_fav3(String mem_fav3) {		this.mem_fav3 = mem_fav3;	}
	public void setMem_portfolio(String mem_portfolio) {		this.mem_portfolio = mem_portfolio;	}
	public void setStartrow(int startrow) {		this.startrow = startrow;	}
	public void setEndrow(int endrow) {		this.endrow = endrow;	}
	public void setSearch_name(String search_name) {		this.search_name = search_name;	}
	public void setSearch_field1(String search_field1) {		this.search_field1 = search_field1;	}
	public void setSearch_field2(String search_field2) {		this.search_field2 = search_field2;	}
	
}
