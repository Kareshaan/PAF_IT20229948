package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PaymentDetails;
import service.IPaymentDetailsService;
import service.PaymentDetailsServiceImpl;


	@WebServlet("/PaymentDetails")
	public class PaymentDetailsServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    public PaymentDetailsServlet() {
	        super();
	    }

	    @WebEndPoint(name="PaymentDetailsServiceImpl")
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.sendRedirect("/paf/payment.jsp");
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	String action = request.getParameter("action");
	    	
	    	if(action.equalsIgnoreCase("NE")) { 
	    		IPaymentDetailsService paymentService = new PaymentDetailsServiceImpl();
	    		paymentService.addPaymentDetail(new PaymentDetails(
	    				0, 
	    				request.getParameter("fname"), 
	    				request.getParameter("nic"), 
	    				request.getParameter("amount"), 
	    				request.getParameter("date"), 
	    				request.getParameter("bname"),
	    				request.getParameter("dcard"), 
	    				request.getParameter("otp")));
	    	
	    		response.sendRedirect("/paf/payment.jsp");
	    	}
	    	else if(action.equalsIgnoreCase("UP")) {
	    		IPaymentDetailsService paymentService = new PaymentDetailsServiceImpl();
	    		paymentService.updatePayment(Integer.parseInt(request.getParameter("id")), new PaymentDetails(
	    				Integer.parseInt(request.getParameter("id")), 
	    				request.getParameter("fname"), 
	    				request.getParameter("nic"), 
	    				request.getParameter("amount"), 
	    				request.getParameter("date"),  
	    				request.getParameter("bname"),
	    				request.getParameter("dcard"),  
	    				request.getParameter("otp")));
	    		  		
	    		response.sendRedirect("/paf/payment.jsp");
	    	}
	    	else if(action.equalsIgnoreCase("DL")) {
	    		IPaymentDetailsService paymentService = new PaymentDetailsServiceImpl();
	    		paymentService.removePaymentDetail(Integer.parseInt(request.getParameter("id")));
	    		
	    		response.sendRedirect("/paf/payment.jsp");
	    	}
	    	
		}

}
