package com.yjk.app;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	ArrayList<RoomShow> getRoomShow();
	void doDeleteRoom(int roomcode);
	void doaddRoom(String roomname,int roomtype, int howmany,int howmuch);
	void doUpdateRoom(int roomcode,String roomname,int roomtype, int howmany,int howmuch);
}
