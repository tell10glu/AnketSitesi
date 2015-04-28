package yapiPackage;

import java.util.ArrayList;

public class Soru {
	int id;
	String soruYazisi;
	int anketid;
	int soruTipi;
	public Soru(int id, String soruYazisi, int anketid, int soruTipi) {
		super();
		this.id = id;
		this.soruYazisi = soruYazisi;
		this.anketid = anketid;
		this.soruTipi = soruTipi;
	}
	public static ArrayList<Soru> anketSoruListesi(int anketID){
		return null;
	}
	public static ArrayList<SoruCevap> soruCevapListesi(){
		return null;
	}
	
	public class SoruCevap {
		int id;
		String cevap;
		int soruId;
		public SoruCevap(int id, String cevap, int soruId) {
			super();
			this.id = id;
			this.cevap = cevap;
			this.soruId = soruId;
		}
	}
}
