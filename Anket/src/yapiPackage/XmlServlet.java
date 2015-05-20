package yapiPackage;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

/**
 * Servlet implementation class XmlServlet
 */
public class XmlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XmlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int anketid = -1;
		try {
			anketid =Integer.parseInt(request.getParameter("anketid"));
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		System.out.println("burdayim");
		DocumentBuilderFactory icFactory =DocumentBuilderFactory.newInstance();
		DocumentBuilder icBuilder;
		try {
			icBuilder = icFactory.newDocumentBuilder();
			Document doc = icBuilder.newDocument();
			Element mainRootElement = doc.createElement("Anketim");
			doc.appendChild(mainRootElement);
			mainRootElement.appendChild(anketOzellikGetir(doc, anketid));
			mainRootElement.appendChild(anketinSoruLariniGetir(doc, anketid));
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer transformer = tf.newTransformer();
			transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
			StringWriter writer = new StringWriter();
			transformer.transform(new DOMSource(doc), new StreamResult(writer));
			String output = writer.getBuffer().toString();
			StringBuilder bl = new StringBuilder();
			bl.append("<");
			for(int i=1;i<output.length();i++){
				if(output.charAt(i-1)=='>'){
					bl.append("\n");
					bl.append(output.charAt(i));
				}else if(i+2<output.length() && output.charAt(i+1)=='<' && output.charAt(i+2)=='/'){
					bl.append(output.charAt(i));
					bl.append("\n");
				}else{

					bl.append(output.charAt(i));
				}
			}
			
			response.getWriter().write(bl.toString());
			System.out.println("XML");
			System.out.println(bl.toString());
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	private Element anketinSoruLariniGetir(Document doc,int anketid){
		ArrayList<Soru> sorularim = Soru.anketSoruListesi(anketid);
		
		Element sorular = doc.createElement("Sorular");
		for(int i=0;i<sorularim.size();i++){
			Element soru = doc.createElement("Soru"+String.valueOf(i+1));
			soru.appendChild(doc.createTextNode(sorularim.get(i).getSoruYazisi()));
			
			for(int j=0;j<sorularim.get(i).getLstCevap().size();j++){
				Element cevap = doc.createElement("Cevap"+String.valueOf(j+1));
				cevap.appendChild(doc.createTextNode(sorularim.get(i).getLstCevap().get(j).getCevap()));
				soru.appendChild(cevap);
			}
			sorular.appendChild(soru);
		}
		return sorular;
	}
	private Element anketOzellikGetir(Document doc,int anketid){
		Anket anketim = Anket.anketiGetir(anketid);
		Element anketOzellikleri = doc.createElement("Ozellikler");
		
		Element anketAdi = doc.createElement("AnketAdi");
		anketAdi.appendChild(doc.createTextNode(String.valueOf(anketim.getAnketAdi())));
		
		Element koyulmaTarihi = doc.createElement("KoyulmaTarihi");
		anketAdi.appendChild(doc.createTextNode(String.valueOf(anketim.getKoyulmaTarihi())));
		
		Element bitisTarihi = doc.createElement("BitisTarihi");
		anketAdi.appendChild(doc.createTextNode(String.valueOf(anketim.getBitisTarihi())));
		
		Element anketID = doc.createElement("AnketId");
		anketID.appendChild(doc.createTextNode(String.valueOf(anketim.getId())));
		anketOzellikleri.appendChild(anketAdi);
		anketOzellikleri.appendChild(koyulmaTarihi);
		anketOzellikleri.appendChild(bitisTarihi);
		anketOzellikleri.appendChild(anketID);
		
		return anketOzellikleri;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
