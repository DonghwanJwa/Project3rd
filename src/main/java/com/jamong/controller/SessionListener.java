package com.jamong.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jamong.dao.VisitDAOImpl;


@WebListener
public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		if(se.getSession().isNew()) {
			HttpSession session = se.getSession();
			WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
			try {
				VisitDAOImpl visitDao = (VisitDAOImpl)wac.getBean("visitDAOImpl");
				visitDao.setTotalCount();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {

	}

}
