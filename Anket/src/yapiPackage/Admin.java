package yapiPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Admin {
	
	public static void AnketSil(int anketid){
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "delete from anket where id="+anketid;
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.execute();
			
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} 
		catch(Exception e){
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
	
	public static void kullaniciSil(String kullaniciadi){
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "delete from kullanici where KullaniciAdi="+kullaniciadi;
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.execute();
			
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} 
		catch(Exception e){
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
	public static void anketibitir(int anketid){
		Connection con = null;
		  java.util.Date utilDate = new java.util.Date();
		    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		try{
			
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "update anket set BitisTarihi=? where id="+anketid;
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setDate(1, sqlDate);
			preparedStmt.execute();
			
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} 
		catch(Exception e){
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
	
	public static void onayKategori(String kad){
		Connection con = null;
		try{
			
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "update kategori set Onay=1 where id="+kad;
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.execute();
			
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
	
	public static ArrayList<String> onaylanmamiskategorilistesi(){
		ArrayList<String> liste=new ArrayList<String>();
		Connection con=null;
		String onaylama=null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "select KategoriAdi from kategori where Onay<>1";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
				onaylama=rs.getString("KategoriAdi");
				liste.add(onaylama);
			}
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
		return liste;
	}
}
