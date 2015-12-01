package org.eteamcs.model;


public class Login extends BaseObject {
    private String username;
    private String password;
    private String lang;


	/**
	 * @return Returns the lang.
	 */
	public String getLang() {
		return lang;
	}
	/**
	 * @param lang The lang to set.
	 */
	public void setLang(String lang) {
		this.lang = lang;
	}
	/**
	 * @return Returns the password.
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password The password to set.
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return Returns the username.
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username The username to set.
	 */
	public void setUsername(String username) {
		this.username = username;
	}
}
