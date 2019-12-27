package com.jamong.dao;

import java.util.List;

import com.jamong.domain.AdminOfferVO;
import com.jamong.domain.OfferVO;

public interface OfferDAO {

	void offer_send(OfferVO ov);

	int offer_count(OfferVO ov);

	List<AdminOfferVO> offer_list(AdminOfferVO ao);

	AdminOfferVO offer_info(int no);

}
