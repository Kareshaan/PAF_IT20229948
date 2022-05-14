package model;

public class PaymentDetails {

		private	int id;
		private	String fname;
		private	String nic;
		private	String amount;
		private	String date;
		private	String bname;
		private	String dcard;
		private	String otp;
		
		
		public PaymentDetails() {
			super();
		}
		public PaymentDetails(int id, String fname,String nic,String amount, String date,String bname,String dcard,String otp) {
				super();
				this.id = id;
				this.fname = fname;
				this.nic = nic;
				this.amount = amount;
				this.date = date;
				this.bname = bname;
				this.dcard = dcard;
				this.otp = otp;
			}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getFname() {
			return fname;
		}
		public void setFname(String fname) {
			this.fname = fname;
		}
		public String getNic() {
			return nic;
		}
		public void setNic(String nic) {
			this.nic = nic;
		}
		public String getAmount() {
			return amount;
		}
		public void setAmount(String amount) {
			this.amount = amount;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getBname() {
			return bname;
		}
		public void setBname(String bname) {
			this.bname = bname;
		}
		public String getDcard() {
			return dcard;
		}
		public void setDcard(String dcard) {
			this.dcard = dcard;
		}
		public String getOtp() {
			return otp;
		}
		public void setOtp(String otp) {
			this.otp = otp;
		}
		
		
}
