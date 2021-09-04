package com.yjk.app;

public class Roominfo {
	private int roomcode;
	private String roomname;
	private String typename;
	private int howmany;
	private int howmuch;
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public Roominfo(int roomcode, String typename, String roomname, int howmany, int howmuch) {
		this.roomcode = roomcode;
		this.typename = typename;
		this.roomname = roomname;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}
	public Roominfo() {
	}
	
}