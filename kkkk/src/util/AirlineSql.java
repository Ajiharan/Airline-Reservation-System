package util;

public class AirlineSql {
	
	public final String connect ="com.mysql.cj.jdbc.Driver";//mysql driver manager
	
	public final String url="jdbc:mysql://localhost/air";
	
	public final String username="root";//DB Username=root
	
	public final String password="root";//DB password=root
	
	
	//public final variables
	public final String sql="select * from register where email_id=? and password=?";
	
	public final String regsql="select * from register where email_id=?";
	
	public final String AdminSql="select * from register where email_id=? and password=? and priority=?";
	
	public final String fromEmail="it18098488@my.sliit.lk";
	
	public final String sqlSelect="select * from register";
	
	public final String delMember="delete from register where uid=?";
	
	public final String selMember="select * from register where uid=?";
	
	public final String selUpdate="update register set firstname=?,lastname=?,email_id=?,password=? where uid=?";
	
	public final String empUpdate="update register set firstname=?,lastname=? where uid=?";
	
	public final String PASS_GET="select * from register where uid=?";
	
	public final String PASS_UPD ="update register set password=? where uid=?";
	
	public final String GET_FLIGHT="select * from flight";
	
	public final String DEL_FLIGHT="delete from flight where fid=?";
	
	public final String GET_NOT="select * from book where cus_id=?";
	
	
}
