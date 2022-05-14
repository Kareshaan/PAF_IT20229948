package service;

import java.util.ArrayList;
import java.util.logging.Logger;

import model.PaymentDetails;

public interface IPaymentDetailsService {
	
		public static final Logger log = Logger.getLogger(IPaymentDetailsService.class.getName());
		
		public void addPaymentDetail(PaymentDetails paymentDetail);
		public  ArrayList<PaymentDetails> getPaymentDetails();
		public  PaymentDetails getPaymentDetails(int id);
		public  PaymentDetails updatePayment(int id, PaymentDetails paymentDetail);
		public  void removePaymentDetail(int id);

	
}
