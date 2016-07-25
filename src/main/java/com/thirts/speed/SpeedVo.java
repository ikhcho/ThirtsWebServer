package com.thirts.speed;

public class SpeedVo {
	private int max_v;
	private int average_v;
	private int distance;
	private int time;
	private String macaddress;
	
	public int getMax_v() {
		return max_v;
	}
	public void setMax_v(int max_v) {
		this.max_v = max_v; 
	}
	public int getAverage_v() {
		return average_v;
	}
	public void setAverage_v(int average_v) {
		this.average_v = average_v;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getMac() {
		return macaddress;
	}
	public void setMac(String macaddress) {
		this.macaddress = macaddress;
	}
}
