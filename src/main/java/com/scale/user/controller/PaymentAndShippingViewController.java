package com.scale.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.product.model.vo.Product;
import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.Address;

/**
 * Servlet implementation class PaymentAndShippingViewController
 */
@WebServlet("/paymentAndShippingView.us")
public class PaymentAndShippingViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentAndShippingViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null) { 
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			
			ArrayList<Address> list = new UserService().selectbasicAddressF(userNo);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/user/userPaymentAndShipping.jsp").forward(request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
