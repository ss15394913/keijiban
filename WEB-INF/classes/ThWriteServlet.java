import executer.*;
import bean.*;
import check.*;

import java.util.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ThWriteServlet extends HttpServlet{

	ThWriteExecuter ThWe=new ThWriteExecuter();
	WriteExecuter We =new WriteExecuter();
	ThReadExecuter TRE=new ThReadExecuter();
	
	String cTe	=("");//checkText
	
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws IOException,ServletException{
		
		req.setCharacterEncoding("Windows-31J");
		
		ThreadBean TB=new ThreadBean();
		CommentBean CB=new CommentBean();
		
		String title=req.getParameter("title");
		String category=req.getParameter("cat");
		String comname=req.getParameter("name");
		String comtext=req.getParameter("text");
		
		
		
		if(comname.length()==0){
			comname="������";
		}
		if(title.length()==0 || title == null){
			title="�������̃X���b�h";
		}
		if(cTe.equals(comtext)){
            res.sendRedirect("/kb/threaderror.html");
			return;
        }
		
		
		boolean isError = ByteCheck.check(title,comname,comtext);
		if(isError){
			res.sendRedirect("/kb/threaderror.html");
			return;
		}
		
		TB.setTitle(title);
		TB.setCategory(category);
		CB.setName(comname);
		CB.setText(comtext);
		
		ArrayList<CommentBean> AL=new ArrayList<>();
		
		AL.add(CB);
		
		int thc=(int)ThWe.execute(TB);
		
		CB.setThreadNo(thc);
		
		We.execute ( CB );
		
		String a="";
		
		ArrayList ArL=new ArrayList();
		
		ArL=(ArrayList)TRE.execute(a);
		
		cTe	=(comtext);//checkText
		
		System.out.println("���ꂪ�^�C�g�����I�I�I"+title);
		req.setAttribute("al",ArL);
		RequestDispatcher dispatcher= req.getRequestDispatcher("/threadresult.jsp");
		dispatcher.forward(req,res);
		
	}
}