package util;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import service.IPaymentDetailsService;



public class CommonUtil {

	public static final Logger log = Logger.getLogger(IPaymentDetailsService.class.getName());
	public static final Properties properties = new Properties();

	static {
		try {
			properties.load(QueryUtil.class.getResourceAsStream(CommonConstants.PROPERTY_FILE));
		} catch (IOException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}
}
