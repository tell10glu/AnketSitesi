package yapiPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Kullanici {
	int kullaniciId;
	String kullaniciAdi;
	int rolId;
	String email;
	public String getEmail(){
		return email;
	}
	public Kullanici(int kullaniciId, String kullaniciAdi, int rolId,
			String email, String kullaniciSifre) {
		super();
		this.kullaniciId = kullaniciId;
		this.kullaniciAdi = kullaniciAdi;
		this.rolId = rolId;
		this.email = email;
		this.kullaniciSifre = kullaniciSifre;
	}
	public int getRolId(){
		return rolId;
	}
	String kullaniciSifre;
	public int getKullaniciId() {
		return kullaniciId;
	}
	public String getKullaniciAdi() {
		return kullaniciAdi;
	}
	public String getKullaniciSifre() {
		return kullaniciSifre;
	}
	public Kullanici(int kullaniciId, String kullaniciAdi, String kullaniciSifre) {
		super();
		this.kullaniciId = kullaniciId;
		this.kullaniciAdi = kullaniciAdi;
		this.kullaniciSifre = kullaniciSifre;
	}
	public Kullanici(int kullaniciId, String kullaniciAdi, String kullaniciSifre,int rolId) {
		super();
		this.kullaniciId = kullaniciId;
		this.kullaniciAdi = kullaniciAdi;
		this.kullaniciSifre = kullaniciSifre;
		this.rolId = rolId;
	}
	public Kullanici(int kullaniciId, String kullaniciAdi, String kullaniciSifre,int rolId,String email) {
		super();
		this.kullaniciId = kullaniciId;
		this.kullaniciAdi = kullaniciAdi;
		this.kullaniciSifre = kullaniciSifre;
		this.rolId = rolId;
		this.email = email;
	}
	/**
	 * @param kadi kullanici tarafindan girilecek kullanici adi
	 * @param password kullanici tarafindan girilecek sifre
	 * @return  kullanici var ise kullanici objesi , yok ise null
	 * @throws Exception kullanici adi veya sifresi hatali seklinde bir string döndürecek .
	 */
	public static Kullanici kullaniciGiris(String kadi,String password) throws Exception  {
		Kullanici kullanici = null;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "select * from Kullanici where KullaniciAdi='"+kadi+"'";
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			if(rs.next()) { 
				String pas = rs.getString(3);
				pas = getPasswordHash(pas);
				if(pas.equals(pas)){
					kullanici = new Kullanici(rs.getInt("id"), kadi, pas,rs.getInt("Rol"),rs.getString("Email"));
				}else{
					throw new Exception("Kullanici Sifresi Hatali!");
				}
				
			} else{
				throw new Exception("Kullanici Adi Hatali!");
			}
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return kullanici ;
	}
	public static void kullaniciEkle(String kullaniciAdi,String sifre,String email,int rol) throws Exception{
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "insert into Kullanici (KullaniciAdi,Sifre,Email,Rol) VALUES(?,?,?,?)";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, kullaniciAdi);
			st.setString(2,getPasswordHash(sifre));
			st.setString(3,email);
			st.setInt(4,rol);
			st.execute();
			
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
	public static ArrayList<Kullanici> kullaniciListesi(){
		ArrayList<Kullanici> alist = new ArrayList<Kullanici>();
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "select * from Kullanici ";
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()) { 
				alist.add(new Kullanici(rs.getInt("id"),rs.getString("KullaniciAdi"),rs.getInt("Rol"),rs.getString("Email"),rs.getString("Sifre")));
			} 
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return alist;
	}
	public static String getPasswordHash(String str){
		long total = 0;
		for(int i =str.length()-1;i>=0;i--){
			Character cr = str.charAt(i);
			int karakter = (int)cr;
			
			int sayi = 1;
			for(int j=0;j<i;j++){
				sayi *=61;
			}
			karakter *=sayi;
			total += karakter;
		}
		return String.valueOf(total);
		
		
	}
}
