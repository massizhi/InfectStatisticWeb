package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.GetInfo;

/**
 * Servlet implementation class updateProvinceInfo
 */
@WebServlet("/updateProvinceInfo")
public class updateProvinceInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProvinceInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String flagp=request.getParameter("flagp");//时间		
		String selectedp=request.getParameter("selectedp");//省份
		request.setAttribute("provinceInfo", selectedp);
		String[] args={flagp,"2",selectedp,"2","ip"};
		try {
			GetInfo temp=new GetInfo();						
			request.setAttribute("infop1",temp.getInfo(args));
			args[3]="3";args[4]="ip";
			GetInfo temp1=new GetInfo();	
			request.setAttribute("infop2",temp1.getInfo(args));
			args[3]="3";args[4]="cure";
			GetInfo temp2=new GetInfo();	
			request.setAttribute("infop3",temp2.getInfo(args));
			args[3]="3";args[4]="dead";
			GetInfo temp3=new GetInfo();	
			request.setAttribute("infop4",temp3.getInfo(args));
			args[3]="1";args[4]="ip";
			GetInfo temp4=new GetInfo();	
			request.setAttribute("infop5",temp4.getInfo(args));
			args[3]="4";args[4]="ip";
			GetInfo temp5=new GetInfo();	
			request.setAttribute("infop6",temp5.getInfo(args));
			args[3]="4";args[4]="cure";
			GetInfo temp6=new GetInfo();	
			request.setAttribute("infop7",temp6.getInfo(args));
			args[3]="4";args[4]="dead";
			GetInfo temp7=new GetInfo();	
			request.setAttribute("infop8",temp7.getInfo(args));
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("province.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
