package yapiPackage;

public class AnketOzellik {
	private int ozellikId,anketId,ozellikDurum;

	public int getOzellikId() {
		return ozellikId;
	}

	public void setOzellikId(int ozellikId) {
		this.ozellikId = ozellikId;
	}

	public int getAnketId() {
		return anketId;
	}

	public void setAnketId(int anketId) {
		this.anketId = anketId;
	}

	public int getOzellikDurum() {
		return ozellikDurum;
	}

	public void setOzellikDurum(int ozellikDurum) {
		this.ozellikDurum = ozellikDurum;
	}

	public AnketOzellik(int ozellikId, int anketId, int ozellikDurum) {
		super();
		this.ozellikId = ozellikId;
		this.anketId = anketId;
		this.ozellikDurum = ozellikDurum;
	}
}
