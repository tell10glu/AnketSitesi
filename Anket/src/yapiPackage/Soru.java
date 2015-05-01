package yapiPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Soru {
	int id;
	String soruYazisi;
	int anketid;
	int soruTipi;
	public int getId() {
		return id;
	}
	public String getSoruYazisi() {
		return soruYazisi;
	}
	public int getAnketid() {
		return anketid;
	}
	public int getSoruTipi() {
		return soruTipi;
	}
	public ArrayList<Cevap> getLstCevap() {
		return lstCevap;
	}

	ArrayList<Cevap> lstCevap = new ArrayList<Cevap>();
	public Soru(int id, String soruYazisi, int anketid, int soruTipi) {
		super();
		this.id = id;
		this.soruYazisi = soruYazisi;
		this.anketid = anketid;
		this.soruTipi = soruTipi;
	}
	public void cevapEkle(Cevap cvp){
		if(lstCevap==null){
			lstCevap = new ArrayList<Cevap>();
		}
		lstCevap.add(cvp);
	}
	public String toString(){
		StringBuilder bl = new StringBuilder();
		bl.append(this.soruYazisi);
		bl.append("<br>");
		for(int i =0;i<this.getLstCevap().size();i++){
				switch (soruTipi) {
				case 1:
					//tek seçim olabilmesi için soruid alması lazım
						bl.append("<input type='radio' name="+this.getId()+" value='1'>"+getLstCevap().get(i).cevap+"<br>");
					break;
				case 2:
					bl.append("<input type='checkbox' name="+this.getLstCevap().get(i).id+" value='1'>"+getLstCevap().get(i).cevap+"<br>");
					break;
				case 3:
					bl.append("<input type='text' name="+this.getLstCevap().get(i).id+" value='1'>"+getLstCevap().get(i).cevap+"<br>");
					break;
				default:
					break;
				}
		}
		bl.append("<hr>");
		return bl.toString();
	}
	public static ArrayList<Soru> anketSoruListesi(int anketId){
		Connection con = null;
		ArrayList<Soru> lstSoru = new ArrayList<Soru>();
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/AnketSitesi","root","tellioglu");
			String query = "select * from Soru where anketId = "+anketId;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
				Soru soru = new Soru(rs.getInt("id"), rs.getString("soru"), anketId, rs.getInt("soruTipi"));
				lstSoru.add(soru);
			}
			st = null;
			for(int i =0;i<lstSoru.size();i++){
				query= "select * from Cevap where soruID = "+lstSoru.get(i).id;
				st = con.createStatement();
				rs = st.executeQuery(query);
				while(rs.next()){
					lstSoru.get(i).cevapEkle(new Cevap(rs.getInt("id"), rs.getString("cevap"), lstSoru.get(i).getId()));
				}
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
		
		return lstSoru;
	}
	

}
