package yapiPackage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Time;
public class Log {
	private static final  String ACTION_INFO = "info";
	private static final String ACTION_ERROR = "error";
	private static final String ACTION_SYSTEM_ERROR = "systemerror";
	private static final String ACTION_USER_LOGIN_ERROR = "loginerror";
	private static final String ACTION_ANKET_SIKAYET = "anketsikayet";
	private static void wDb(String cikti,String ACTION){
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "insert into Log(Tarih,Saat,AksiyonAdi,Cikti) VALUES (?,?,?,?)";
			PreparedStatement st = con.prepareStatement(query);
			st.setDate(1, new Date(new java.util.Date().getTime()));
			st.setTime(2, new Time(new java.util.Date().getTime()));
			st.setString(3,ACTION);
			st.setString(4, cikti);
			st.executeUpdate();
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} 
		catch(Exception e){
			Log.systemError(e.getMessage().toString());
			e.getMessage();
		}
		finally{
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	public static void anketSikayet(String cikti){
		wDb(cikti,ACTION_ANKET_SIKAYET);
	}
	public static void systemError(String cikti){
		wDb(cikti,ACTION_SYSTEM_ERROR);
		
	}
	public static void loginError(String cikti){
		wDb(cikti,ACTION_USER_LOGIN_ERROR);
	}
	public static void i(String cikti){
		wDb(cikti, ACTION_INFO);
		
	}
	public static void e(String cikti){
		wDb(cikti,ACTION_ERROR);
	}
}
