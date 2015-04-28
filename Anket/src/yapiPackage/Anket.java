package yapiPackage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;


public class Anket {
	int id;
	int kullaniciId;
	String anketAdi;
	Date koyulmaTarihi,bitisTarihi;
	public int getId() {
		return id;
	}
	public int getKullaniciId() {
		return kullaniciId;
	}
	public String getAnketAdi() {
		return anketAdi;
	}
	public Date getKoyulmaTarihi() {
		return koyulmaTarihi;
	}
	public Date getBitisTarihi() {
		return bitisTarihi;
	}
	public boolean isIpKullanimIzin() {
		return ipKullanimIzin;
	}
	boolean ipKullanimIzin;
	public static ArrayList<Anket> anketListesiGetir(){
		ArrayList<Anket> anket = new ArrayList<Anket>();
		return anket;
		
	}
	public Anket(int id, int kullaniciId, String anketAdi, Date koyulmaTarihi,
			Date bitisTarihi, boolean ipKullanimIzin) {
		super();
		this.id = id;
		this.kullaniciId = kullaniciId;
		this.anketAdi = anketAdi;
		this.koyulmaTarihi = koyulmaTarihi;
		this.bitisTarihi = bitisTarihi;
		this.ipKullanimIzin = ipKullanimIzin;
	}
	public static Anket anketiGetir(int anketID){
		Anket anket = null;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/AnketSitesi","root","tellioglu");
			String query = "select * from Anket where ID = "+anketID;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if(rs.next()){
				anket = new Anket(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getBoolean(6));
			}
			
			
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
		
		
		return anket;
	}
	public static ArrayList<Anket> anketListesiGetir(Kullanici kullanici){
		ArrayList<Anket> list = new ArrayList<Anket>();
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/AnketSitesi","root","tellioglu");
			String query = "select * from Anket where KullaniciID = "+kullanici.getKullaniciId();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
				list.add(new Anket(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getBoolean(6)));
			}
			
			
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
		return list;
	}
	public static ArrayList<Anket> anketListesiGetir(int kullaniciid){
		ArrayList<Anket> list = new ArrayList<Anket>();
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/AnketSitesi","root","tellioglu");
			String query = "select * from Anket where KullaniciID = "+kullaniciid;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
				list.add(new Anket(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getBoolean(6)));
			}
			
			
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
		return list;
	}
	public static void AnketeKategoriEkle(Anket anket , int[] kategoriID){
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/AnketSitesi","root","tellioglu");
			String query = "insert into AnketKategori (AnketID,KategoriID) VALUES(?,?)";
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1, anket.id);
			for(int i=0;i<kategoriID.length;i++){
				st.setInt(2,kategoriID[i]);
				st.execute();
			}
			
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
}
