package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.GetInfo;

/**
 * Servlet implementation class updateInfo
 */
@WebServlet("/updateChinaInfo")
public class updateChinaInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateChinaInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String flag=request.getParameter("flag");//时间
		String[] args={flag,"1","2","ip"};
		try {
			GetInfo temp=new GetInfo();						
			request.setAttribute("info",temp.getInfo(args));
			args[2]="2";args[3]="ip";
			GetInfo temp1=new GetInfo();	
			request.setAttribute("info2",temp1.getInfo(args));
			args[2]="2";args[3]="sp";
			GetInfo temp2=new GetInfo();	
			request.setAttribute("info3",temp2.getInfo(args));
			args[2]="1";args[3]="ip";
			GetInfo temp3=new GetInfo();	
			request.setAttribute("info4",temp3.getInfo(args));
			args[2]="1";args[3]="sp";
			GetInfo temp4=new GetInfo();	
			request.setAttribute("info5",temp4.getInfo(args));
			args[2]="3";args[3]="ip";
			GetInfo temp5=new GetInfo();	
			request.setAttribute("info6",temp5.getInfo(args));
			args[2]="3";args[3]="cure";
			GetInfo temp6=new GetInfo();	
			request.setAttribute("info7",temp6.getInfo(args));
			args[2]="3";args[3]="dead";
			GetInfo temp7=new GetInfo();	
			request.setAttribute("info8",temp7.getInfo(args));
			GetInfo temp8=new GetInfo();	
			args[2]="4";args[3]="ip";
			request.setAttribute("info9",temp8.getInfo(args));
			args[2]="4";args[3]="cure";
			GetInfo temp9=new GetInfo();	
			request.setAttribute("info10",temp9.getInfo(args));
			args[2]="4";args[3]="dead";
			GetInfo temp10=new GetInfo();	
			request.setAttribute("info11",temp10.getInfo(args));
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("china.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
