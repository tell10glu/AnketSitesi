package yapiPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AnahtarKelime {

	int id;
	String key;
	boolean onay;
	public AnahtarKelime(int id, String key) {
		super();
		this.id = id;
		this.key = key;
	}
	
	
	public AnahtarKelime(int id, String key, boolean onay) {
		super();
		this.id = id;
		this.key = key;
		this.onay = onay;
	}


	public void setId(int id) {
		this.id = id;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public void setOnay(boolean onay) {
		this.onay = onay;
	}

	public int getId() {
		return id;
	}
	public String getKey() {
		return key;
	}
	public boolean isOnay() {
		return onay;
	}
	/**
	 * Anahtar kelime eğer admin tarafından eklenirse direk onaylı , admin tarafından gelmez ise onaysız gelir .
	 * @param kullanici 
	 * @param kelime
	 * @return
	 */
	public static boolean anahtarKelimeEkle(Kullanici kullanici,String kelime){
		if(KullaniciRol.kullaniciRolunuGetir(kullanici).getRolAdi().equals("admin")){
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection con = Connections.getDatabaseConnectionPath();
				String query = "insert into Keywords(Key,Onay) VALUES (?,?)";
				PreparedStatement statement = con.prepareStatement(query);
				statement.setString(1, kelime);
				statement.setBoolean(2, true);
			}catch(ClassNotFoundException ex){
				ex.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else{
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection con = Connections.getDatabaseConnectionPath();
				String query = "insert into Keywords(Key,Onay) VALUES (?,?)";
				PreparedStatement statement = con.prepareStatement(query);
				statement.setString(1, kelime);
				statement.setBoolean(2, false);
				statement.execute();
			}catch(ClassNotFoundException ex){
				ex.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
	}
	/** Anahtar kelimeyi silmeye yarar.
	 * @param kullanici
	 * @param kelime 
	 * @return
	 */
	public static boolean anahtarKelimeyiSil(Kullanici kullanici,AnahtarKelime kelime){
		KullaniciRol rol = KullaniciRol.kullaniciRolunuGetir(kullanici);
		if(rol.getRolAdi().equals("admin")){
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection con = Connections.getDatabaseConnectionPath();
				String query = "delete from Keywords where id = ?";
				PreparedStatement statement = con.prepareStatement(query);
				statement.setInt(1, kelime.getId());
				statement.execute();
			}catch(Exception ex){
				ex.printStackTrace();
			}
			
			
			return true;
		}else{
			return false;
		}
	}
	/**
	 * Anahtar kelimeyi silmeye yarar. 
	 * @param kullanici kullanicinin admin olup olmaması için gerekli 
	 * @param kelime anahtar kelime
	 * @return true veya false silme durumuna göre
	 */
	public static boolean anahtarKelimeyiSil(Kullanici kullanici,String kelime){
		KullaniciRol rol = KullaniciRol.kullaniciRolunuGetir(kullanici);
		if(rol.getRolAdi().equals("admin")){
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection con = Connections.getDatabaseConnectionPath();
				String query = "delete from Keywords where Key = ?";
				PreparedStatement statement = con.prepareStatement(query);
				statement.setString(1, kelime);
				statement.execute();
			}catch(Exception ex){
				ex.printStackTrace();
			}
			
			
			return true;
		}else{
			return false;
		}
	}
	/**
	 * @param kullanici 
	 * @param kelime
	 * Kullanici admin değilse onaylama işlemi gerçekleşmeyecek.
	 * Eğer kelime onaylıysa onayı kaldır , değilse onayla .
	 */
	public static void anahtarKelimeyiOnayla(Kullanici kullanici,AnahtarKelime kelime){
		if(KullaniciRol.kullaniciRolunuGetir(kullanici).getRolAdi().equals("admin")){
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection con = Connections.getDatabaseConnectionPath();
				String query = "update  Keywords set Onay=? where Key = ?";
				PreparedStatement statement = con.prepareStatement(query);
				statement.setBoolean(1, !kelime.isOnay());
				statement.setString(2, kelime.getKey());
				statement.execute();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
	}
	/**
	 * Onayli onaysiz bütün anahtar kelime listesini döndürür . 
	 * @return
	 */
	public ArrayList<AnahtarKelime> anahtarKelimeListesi(){
		ArrayList<AnahtarKelime> kelimeListesi = new ArrayList<AnahtarKelime>();
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = Connections.getDatabaseConnectionPath();
			String query ;
			query = "Select * from AnahtarKelime";
			Statement statement = con.prepareStatement(query);
			ResultSet set = statement.executeQuery(query);
			while(set.next()){
				AnahtarKelime kelime = new AnahtarKelime(set.getInt("id"), set.getString("Key"),set.getBoolean("Onay"));
				kelimeListesi.add(kelime);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return kelimeListesi;
		
	}
	public static ArrayList<Anket> anahtarKelimeyeAitAnketleriGetir(AnahtarKelime kelime){
		ArrayList<Anket> alist = new ArrayList<Anket>();
		
		
		return alist;
	}
	public static ArrayList<Anket> anahtarKelimeyeAitAnketleriGetir(String[] kelimeler){
		ArrayList<Anket> alist = new ArrayList<Anket>();
		
		return alist;
	}
}
