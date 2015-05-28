package yapiPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Kategoriler {
	int id;
	int parentid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public String getKategoriAdi() {
		return KategoriAdi;
	}
	public void setKategoriAdi(String kategoriAdi) {
		KategoriAdi = kategoriAdi;
	}
	public boolean isOnay() {
		return Onay;
	}
	public void setOnay(boolean onay) {
		Onay = onay;
	}
	public ArrayList<Kategoriler> getAltKategori() {
		return altKategori;
	}
	public void setAltKategori(ArrayList<Kategoriler> altKategori) {
		this.altKategori = altKategori;
	}
	String KategoriAdi;
	boolean Onay;
	ArrayList<Kategoriler> altKategori;
	public Kategoriler(int id, String kategoriAdi, boolean onay,int parentid) {
		super();
		this.id = id;
		this.parentid = parentid;
		KategoriAdi = kategoriAdi;
		Onay = onay;
		
	}
	public static ArrayList<Kategoriler> kategoriListesi(){
		ArrayList<Kategoriler> list = new ArrayList<Kategoriler>();
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "select * from Kategori ";
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()) { 
				Kategoriler kat = new Kategoriler(rs.getInt(1),rs.getString(2),rs.getBoolean(3),rs.getInt(4));
				if(kat.parentid!=-1){
					int i =0;
					while(i<list.size() && kat.parentid!=list.get(i).getId())
						i++;
					if(i==list.size()){
						list.add(kat);
					}else{
						if(list.get(i).altKategori==null){
							list.get(i).altKategori = new ArrayList<Kategoriler>();
						}
						list.get(i).altKategori.add(kat);
					}
				}else{
					list.add(kat);
				}
			} 
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} catch (SQLException e) {
			Log.systemError(e.getMessage().toString());
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
		
		return list;
	}
}
