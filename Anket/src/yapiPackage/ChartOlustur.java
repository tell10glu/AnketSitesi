package yapiPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ChartOlustur {
	
	
	public static ArrayList<String> charthesapla(int soruid){
		int sayi=0;
		ArrayList<String> listem=null;
		Connection con=null;
		try{
			listem=new ArrayList<String>();
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query ;
			query = "Select id from cevap where soruID="+soruid;
			Statement statement = con.prepareStatement(query);
			ResultSet set = statement.executeQuery(query);
			while(set.next()){
				sayi=set.getInt(0);
				listem.add(Integer.toString(sayi));
			}	
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return listem;
	}
	public static int sayiyigetir(int cevapid){
		Connection con=null;
		int sayi=0;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query ;
			query = "Select count(cevapID) from kullanicicevap where cevapID="+cevapid;
			Statement statement = con.prepareStatement(query);
			ResultSet set = statement.executeQuery(query);
			while(set.next()){
				sayi=set.getInt(0);
			}	
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return sayi;
		
		
	}
	public static ArrayList<String> cevaplariAl(int soruid){
		ArrayList<String> listem=null;
		try{
			listem=new ArrayList<String>();
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = Connections.getDatabaseConnectionPath();
			String query ;
			query = "Select cevap from cevap where soruID="+soruid;
			Statement statement = con.prepareStatement(query);
			ResultSet set = statement.executeQuery(query);
			while(set.next()){
				listem.add(set.getString("cevap"));
			}
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listem;	
	}
}
