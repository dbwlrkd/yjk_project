package com.yjk.app;

public interface iMember {
	void doSignin(String realname,String userid, String passcode);
	int doCheckUser(String userid,String passcode);
}
