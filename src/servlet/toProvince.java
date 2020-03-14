package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.GetInfo;

/**
 * Servlet implementation class toProvince
 */
@WebServlet("/toProvince")
public class toProvince extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public toProvince() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String sp=request.getParameter("prov");
		request.setAttribute("provinceInfo", sp);
		String[] args={"2020-02-02","2",sp,"2","ip"};
		try {
			//疫情数据
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
			
			//line1数据
			args[0]="2020-01-19";args[3]="4";args[4]="ip";
			GetInfo temp8=new GetInfo();	
			request.setAttribute("infop9",temp8.getInfo(args));
			args[0]="2020-01-20";
			GetInfo temp9=new GetInfo();	
			request.setAttribute("infop10",temp9.getInfo(args));
			args[0]="2020-01-21";
			GetInfo temp10=new GetInfo();	
			request.setAttribute("infop11",temp10.getInfo(args));
			args[0]="2020-01-22";
			GetInfo temp11=new GetInfo();	
			request.setAttribute("infop12",temp11.getInfo(args));
			args[0]="2020-01-23";
			GetInfo temp12=new GetInfo();	
			request.setAttribute("infop13",temp12.getInfo(args));
			args[0]="2020-01-24";
			GetInfo temp13=new GetInfo();	
			request.setAttribute("infop14",temp13.getInfo(args));
			args[0]="2020-01-25";
			GetInfo temp14=new GetInfo();	
			request.setAttribute("infop15",temp14.getInfo(args));
			args[0]="2020-01-26";
			GetInfo temp15=new GetInfo();	
			request.setAttribute("infop16",temp15.getInfo(args));
			args[0]="2020-01-27";
			GetInfo temp16=new GetInfo();	
			request.setAttribute("infop17",temp16.getInfo(args));
			args[0]="2020-01-28";
			GetInfo temp17=new GetInfo();	
			request.setAttribute("infop18",temp17.getInfo(args));
			args[0]="2020-01-29";
			GetInfo temp18=new GetInfo();	
			request.setAttribute("infop19",temp18.getInfo(args));
			args[0]="2020-01-30";
			GetInfo temp19=new GetInfo();	
			request.setAttribute("infop20",temp19.getInfo(args));
			args[0]="2020-01-31";
			GetInfo temp20=new GetInfo();	
			request.setAttribute("infop21",temp20.getInfo(args));
			args[0]="2020-02-01";
			GetInfo temp21=new GetInfo();	
			request.setAttribute("infop22",temp21.getInfo(args));
			args[0]="2020-02-02";
			GetInfo temp22=new GetInfo();	
			request.setAttribute("infop23",temp22.getInfo(args));
			
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
