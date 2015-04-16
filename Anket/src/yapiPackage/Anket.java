package yapiPackage;

import java.sql.Date;
import java.util.ArrayList;

public class Anket {
	int id;
	int kullaniciId;
	String anketAdi;
	Date koyulmaTarihi,bitisTarihi;
	boolean ipKullanimIzin;
	public static ArrayList<Anket> anketListesiGetir(){
		ArrayList<Anket> anket = new ArrayList<Anket>();
		return anket;
		
	}
	
}
