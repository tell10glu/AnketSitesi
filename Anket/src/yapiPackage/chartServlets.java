package yapiPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;
public class chartServlets extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int anketid ;
		int requestId;
		try {
			requestId = Integer.parseInt(req.getParameter("soruid"));
		} catch (Exception e) {
			Log.systemError(e.getMessage().toString());
			// TODO: handle exception
			requestId = 0;
		}
		try {
			anketid =  Integer.parseInt(req.getParameter("anketid"));
		} catch (Exception e) {
			e.printStackTrace();
			Log.systemError(e.getMessage().toString());
			return;
			// TODO: handle exception
		}
		resp.setContentType("text/plain");
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			con = Connections.getDatabaseConnectionPath();
			String query = "select cevap.cevap,COUNT(*) from Anket,Soru,Cevap,KullaniciCevap where Anket.id = "+anketid+" AND Soru.id = cevap.soruID AND KullaniciCevap.cevapId = cevap.id AND Anket.id = Soru.anketId AND Soru.id="+requestId+"  group by kullaniciCevap.cevapID";
			System.out.println(query);
			Statement st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			StringBuilder bl = new StringBuilder();
			// array halinde ...
			// ilk dönen soruid
			// ikinci dönen cevapid
			// son dönen soruda cevapların seçilme sayısı (Count(*))
			while(rs.next()){
					bl.append(rs.getString(1));
					bl.append(",,");
					bl.append(rs.getInt(2));
					bl.append(";;");
				
			}
			PrintWriter out = resp.getWriter();
			out.print(bl.toString());
			
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} 
		catch(Exception e){
			Log.systemError(e.getMessage().toString());
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (Exception e) {
				Log.systemError(e.getMessage().toString());
				// TODO: handle exception
			}
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
