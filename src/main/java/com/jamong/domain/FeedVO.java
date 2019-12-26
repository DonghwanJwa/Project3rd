package com.jamong.domain;

/** Database Feed Value Object **/
public class FeedVO {
	
	private int feed_no;      
	private int feed_state;
	private int feed_step;
	private int feed_mem_no;          // 피드 보낼 아이디
	private String feed_mem_id;       // 링크 보내줄 회원 아이디
	private int feed_bo_no;           // 링크용 게시글번호
	private int feed_book_no;         // 링크용 책번호
	private String feed_date;
	private int mem_no;               // 피드를 받는 아이디
	private MemberVO memberVO;
	
	/** Setter **/
	public void setFeed_no(int feed_no) 		   {		this.feed_no = feed_no;				}
	public void setFeed_state(int feed_state) 	   {		this.feed_state = feed_state;		}
	public void setFeed_step(int feed_step) 	   {		this.feed_step = feed_step;			}
	public void setFeed_mem_id(String feed_mem_id) {		this.feed_mem_id = feed_mem_id;		}
	public void setFeed_bo_no(int feed_bo_no) 	   {		this.feed_bo_no = feed_bo_no;		}
	public void setFeed_book_no(int feed_book_no)  {		this.feed_book_no = feed_book_no;	}
	public void setFeed_date(String feed_date)     {		this.feed_date = feed_date;			}
	public void setMem_no(int mem_no) 			   {		this.mem_no = mem_no;				}	
	public void setFeed_mem_no(int feed_mem_no)	   {		this.feed_mem_no = feed_mem_no;		}
	public void setMemberVO(MemberVO memberVO)	   {		this.memberVO = memberVO;			}

	/** Getter **/
	public int getFeed_no() 	   {		return feed_no;			}
	public int getFeed_state() 	   {		return feed_state;		}
	public int getFeed_step() 	   {		return feed_step;		}
	public String getFeed_mem_id() {		return feed_mem_id;		}
	public int getFeed_bo_no() 	   {		return feed_bo_no;		}
	public int getFeed_book_no()   {		return feed_book_no;	}
	public String getFeed_date()   {		return feed_date;		}
	public int getMem_no() 		   {		return mem_no;			}
	public int getFeed_mem_no()    {		return feed_mem_no;		}	
	public MemberVO getMemberVO()  {		return memberVO;		}
	
}
