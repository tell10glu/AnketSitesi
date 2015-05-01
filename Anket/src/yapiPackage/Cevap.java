package yapiPackage;

public class Cevap {
	int id;
	String cevap;
	int soruId;
	public Cevap(int id, String cevap, int soruId) {
		this.id = id;
		this.cevap = cevap;
		this.soruId = soruId;
	}
	public int getId() {
		return id;
	}
	public String getCevap() {
		return cevap;
	}
	public int getSoruId() {
		return soruId;
	}
}
