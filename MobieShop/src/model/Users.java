package model;

import java.sql.Date;

public class Users {
	private long userID;
	private String userEmail;
	private String userPass;
	private String userName;
	private String userPhone;
	private String userBirth;
	private String userAddress;
	private String userSex;
	private boolean userRole;

	public Users() {
		super();
	}

	public Users(long userID, String userEmail, String userPass, String userName, String userPhone, String userBirth,
			String userAddress, String userSex, boolean userRole) {
		super();
		this.userID = userID;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userBirth = userBirth;
		this.userAddress = userAddress;
		this.userSex = userSex;
		this.userRole = userRole;
	}

	public long getUserID() {
		return userID;
	}

	public void setUserID(long userID) {
		this.userID = userID;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public boolean isUserRole() {
		return userRole;
	}

	public void setUserRole(boolean userRole) {
		this.userRole = userRole;
	}

	@Override
	public String toString() {
		return "Users [userID=" + userID + ", userEmail=" + userEmail + ", userPass=" + userPass + ", userName="
				+ userName + ", userPhone=" + userPhone + ", userBirth=" + userBirth + ", userAddress=" + userAddress
				+ ", userSex=" + userSex + ", userRole=" + userRole + "]";
	}

}
