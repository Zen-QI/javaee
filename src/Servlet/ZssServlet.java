package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Enitity.User;
import Enitity.ks;
import ServiceDao.serviceDao;
import ServiceDaoImpl.serviceDaoImpl;

/**
 * Servlet implementation class ZssServlet
 */
@WebServlet("/ZssServlet")
public class ZssServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    serviceDao sd=new serviceDaoImpl();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZssServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		
		switch (action) {
		case "register":
			regiseter(request,response);
			break;
		case "login":
			login(request,response);
			break;
		case "add":
			add(request,response);
			break;
		case "uadd":
			uadd(request,response);
			break;
		case "detele":
			detele(request,response);
			break;
		case "list":
			list(request,response);
			break;
		case "update":
			update(request,response);
			break;
		case "uedit":
			uedit(request,response);
			break;
		case "deteleuser":
			udetele(request,response);
			break;
		
		
		}
	   
	}
	
	

	public void regiseter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		User user=new User(name,pass,tel,email);
		int code = sd.insert(user);
		if(code==1) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			  PrintWriter out = response.getWriter();
		      out.flush();//清空缓存
		      out.println("<script>");//输出script标签
		      out.println("alert('已存在');");//js语句：输出alert语句
		      out.println("history.back();");//js语句：输出网页回退语句
		      out.println("</script>");//输出script结尾标签
		}
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		User findOne = sd.findOne(name,pass);
		if(findOne!=null) {
			list(request,response);
		}else {
			  PrintWriter out = response.getWriter();
		      out.flush();//清空缓存
		      out.println("<script>");//输出script标签
		      out.println("alert('账号密码错误！');");//js语句：输出alert语句
		      out.println("history.back();");//js语句：输出网页回退语句
		      out.println("</script>");//输出script结尾标签
		}
		
	}
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ks> ksList = sd.findAll();
		request.setAttribute("ksList", ksList);
		List<User> userList = sd.find();
		request.setAttribute("userList", userList);
	
	
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tm = request.getParameter("tm");
		String ky = request.getParameter("ky");
		String type = request.getParameter("type");
		String nd = request.getParameter("nd");
		ks ks1 = new ks(tm,ky,type,nd);
		sd.add(ks1);
		request.getRequestDispatcher("/ZssServlet?action=list").forward(request, response);
		 
	}
	public void uadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
	
		User user=new User(name,pass,tel,email);
		sd.uadd(user);
		request.getRequestDispatcher("/ZssServlet?action=list").forward(request, response);
		 
	}
	public void detele(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		sd.delete(id);
		request.getRequestDispatcher("/ZssServlet?action=list").forward(request, response);
		
		
	}
	public void udetele(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("zss"));
		sd.udelete(id);
		request.getRequestDispatcher("/ZssServlet?action=list").forward(request, response);
		
	}
	
	
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		String tm = request.getParameter("tm");
		String ky = request.getParameter("km");
		String type = request.getParameter("type");
		String nd = request.getParameter("nd");		
			
		sd.edit(id,tm,ky,type,nd);
		request.getRequestDispatcher("/ZssServlet?action=list").forward(request, response);
		
	}
	public void uedit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("yy"));
		
		
		
		  String username = request.getParameter("username"); String password =
		  request.getParameter("password"); String tel = request.getParameter("tel");
		  String email = request.getParameter("email");
		  
		  sd.uedit(id,username,password,tel,email);
		  request.getRequestDispatcher("/ZssServlet?action=list").forward(request,response);
		 
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
