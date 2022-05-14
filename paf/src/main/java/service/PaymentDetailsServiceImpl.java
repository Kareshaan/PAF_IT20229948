package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;

import util.CommonConstants;
import util.DBConnectionUtil;
import util.QueryUtil;

import model.PaymentDetails;

	public class PaymentDetailsServiceImpl implements IPaymentDetailsService{

		public static final Logger log = Logger.getLogger(PaymentDetailsServiceImpl.class.getName());
		
		private static Connection connection;
		private PreparedStatement preparedStatement;
		
		@override
		public void addPaymentDetail(PaymentDetails paymentDetail) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_PAYMENT));
				connection.setAutoCommit(false);
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, paymentDetail.getFname());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, paymentDetail.getNic());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, paymentDetail.getAmount());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, paymentDetail.getDate());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, paymentDetail.getBname());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, paymentDetail.getDcard());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, paymentDetail.getOtp());
				
				
				
				preparedStatement.execute();
				connection.commit();
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
		}

		public ArrayList<PaymentDetails> getPaymentDetails() {
			return actionOnPaymentDetails(0);
		}

		public PaymentDetails getPaymentDetails(int id) {
			return actionOnPaymentDetails(id).get(0);
		}
		
		private ArrayList<PaymentDetails> actionOnPaymentDetails(int id) {
			ArrayList<PaymentDetails> paymentList = new ArrayList<PaymentDetails>();
			
			try {
				connection = DBConnectionUtil.getDBConnection();
				
				if (id != 0) {
					preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_PAYMENT));
					preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, id);
				}
				else {
					preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_PAYMENT));
				}
				
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					PaymentDetails payment = new PaymentDetails();
					payment.setId(resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE));
					payment.setFname(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
					payment.setNic(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
					payment.setAmount(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
					payment.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
					payment.setBname(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
					payment.setDcard(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
					payment.setOtp(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
					paymentList.add(payment);
				}
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
			
			return paymentList;
		}


		public PaymentDetails updatePayment(int id, PaymentDetails paymentDetail) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_PAYMENT));
				
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, paymentDetail.getFname());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, paymentDetail.getNic());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, paymentDetail.getAmount());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, paymentDetail.getDate());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, paymentDetail.getBname());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, paymentDetail.getDcard());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, paymentDetail.getOtp());
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_EIGHT, id);
				
				preparedStatement.executeUpdate();
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
			
			return getPaymentDetails(id);
		}

		public void removePaymentDetail(int id) {
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_DELETE_PAYMENT));
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, id);
				preparedStatement.executeUpdate();
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			} finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException ex) {
					log.log(Level.SEVERE, ex.getMessage());
				}
			}
		}

}
