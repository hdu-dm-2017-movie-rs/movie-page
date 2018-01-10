<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest,org.apache.struts2.ServletActionContext" %>
<%@ page import="net.sf.json.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>main.jsp</title>
    <%
    int minutes = 10; 
    Date d = new Date(); 
    String modDate = d.toGMTString(); 
    String expDate = null; 
    expDate = (new Date(d.getTime() + minutes * 60000)).toGMTString(); 
    response.setHeader("Last-Modified", modDate); 
    response.setHeader("Expires", expDate); 
    response.setHeader("Cache-Control", "public"); //   HTTP/1.1 
    response.setHeader("Pragma", "Pragma"); //   HTTP/1.0  
     %>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%--
      这里一共提交3个值到另一个页面,useName,moId以session的方式，rate用action的方式，下面是提交页面的情况
   // tj.jsp
     <body>
    <%request.setCharacterEncoding("GB2312");
    String rat=request.getParameter("rat");
    String userName=(String)session.getAttribute("userName");
    String moId=(String)session.getAttribute("moId");
    %>
         用户评分：<%=rat %> <br>
         用户名：<%=userName %><br>
         电影ID:<%=moId %>
  </body>
   --%>
  <body>
  	<%
  		/*String username=null;
  	 	Account acc=(Account)session.getAttribute("ret_user");
  	 	username=acc.getUsername();
  	 	if(username!=null){
  	 		out.println(acc.getUsername());
  	 	}*/
  	 	/*userName测试数据 最后去掉*/
  	 	//userName通过session方式提交到了tj.jsp，然后另一个页面接收。
  	 	String userName="huihui";
  	 	session.setAttribute("userName",userName);
	 %>
  	
  	<%
  	    /*该部分为具体解析过程*/
  		/* urlData=new UrlConnect();
  		String str=null;
  		str=urlData.httpPost(username);
  		//显示集合
  		List<String> mnamelist=new ArrayList<String>();
        List<String> imglist=new ArrayList<String>();
        List<String> modlist=new ArrayList<String>();
        List<String> ranklist=new ArrayList<String>();
        List<String> summarylist=new ArrayList<String>();
        int length=0;
  		if(str!=null){
  			out.print(str);  		
	  		JSONObject jsonx = JSONObject.fromObject(str);
  			JSONArray recja = jsonx.getJSONArray("subjects");
	        length=recja.size();
	        System.out.println("lengtha:"+length);
	        for (int i = 0; i < recja.size(); i++) {  
	            JSONObject jo = recja.getJSONObject(i);             
	            String namestr = jo.getString("movieName"); 
	            String imgstr=jo.getString("img");
	            String modstr=jo.getString("movieId");
	            String rankstr=jo.getString("rating");
	            String summarystr=jo.getString("summary");
	            mnamelist.add(namestr);
	            imglist.add(imgstr);
	            modlist.add(modstr);
	            ranklist.add(rankstr);
	            summarylist.add(summarystr);
	            System.out.println(namestr);  
	        } 
	        for(String name:mnamelist){
	        	 System.out.println(name);
	        }
  		}*/
  		/*以上为具体解析过程*/
  		//str是电影列表--
  	 %>     
  	      <% 	            
                /**
                                          以下为测试数据，具体整合时可去掉*/
                String[] m={"movie1","movie2","movie3","movie4","movie5"};
                List<String> m1=Arrays.asList(m);
                List<String> mnamelist=new ArrayList<String>(m1); 
                /*for (int i1 = 0; i1< mnamelist.size(); i1++) {  
                    System.out.println(mnamelist.get(i1));  
                } */
                String[] im={"url1","url2","url3","url4","url5"};
                List<String> im1=Arrays.asList(im);
                List<String> imglist=new ArrayList<String>(im1);
                /*for (int i2 = 0; i2 < imglist.size(); i2++) {  
                    System.out.println(imglist.get(i2));  
                } */
                String[] mo={"1","2","3","4","5"};
                List<String> mod=Arrays.asList(mo);
                List<String> modlist=new ArrayList<String>(mod);
                /*for (int i = 0; i < modlist.size(); i++) {  
                    System.out.println(modlist.get(i));  
                }*/
                String[] r={"9.1","7.8","3.8","6.4","5.9"};
                List<String> rank=Arrays.asList(r);
                List<String> ranklist=new ArrayList<String>(rank);
                /*for (int i = 0; i < ranklist.size(); i++) {  
                    System.out.println(ranklist.get(i));  
                } */
                String[] s={"comdy","fantacy","Documentary","Adenventure","mystery"};
                List<String> summary=Arrays.asList(s);
                List<String> summarylist=new ArrayList<String>(summary);
                /*for (int i = 0; i < summarylist.size(); i++) {  
                    System.out.println(summarylist.get(i));  
                }*/
                int length=modlist.size();
                /**
                                          以上为测试数据，具体整合时可去掉*/      	    	           
  	       %>
  	 <div id="top">
        <span>电影推荐</span>
     </div>
     <div id="movie-bar">
  	    <h4>推荐给&nbsp;
        <!-- 这里改成用户的信息 -->
        <%=userName%>您的电影
        <!-- <%/*=acc.getUsername()*/%>您的</a>&nbsp;电影 -->
        </h4>     
     </div>
  	   	  <%for (int i=0;i <length;i++) {%> 
  	          <ul id="movie-items">
  		         <li class="movie-item">
  		         <a href="#">
  		         <p><%=imglist.get(i)%></p>
                   <!-- <img src="..." alt="" srcset="" class="movie-img"> -->
                 </a>
                   <!-- 链接改成电影图片的 -->                   
                        <div>   
                            <span class="movie-name"><%=mnamelist.get(i) %></span>
                            <span class="movie-rank">电影评分：<%=ranklist.get(i) %></span>
                        </div>
                        <div>
                            <span class="movie-summary">电影简介：<%=summarylist.get(i)%>
                            </span>
                        </div>
                        <div>
                            <span class="movie-id" >电影ID：<%=modlist.get(i)%>
                            <%
                                //用session的方式把moId提交到了tj.jsp(我测试)
                                String moId=modlist.get(i);
                                session.setAttribute("moId",moId);
                             %>                            
                            </span>
                        </div>
                    </div>
                    <div class="urate">
                      <!-- 我测试的是提交到了tj.jsp界面 ,你改成你的那个-->
                       <form action="tj.jsp" method="post">
                       <p class="rt">用户评分:
                       <input name="rat" type="radio" value="2">2
                       <input name="rat" type="radio" value="4">4
                       <input name="rat" type="radio" value="6">6
                       <input name="rat" type="radio" value="8">8
                       <input name="rat" type="radio" value="10" checked>10
                       <input type="submit" name="submit" value="提交">
                       </p>
                       </form>
                    </div>  
                  </li>
               </ul>   
       <%}%>
     <div class="float-clear">
     </div>
     <div>
        <div id="middle">
            <div class="form">
                <div class="middle-tool">
                    <!-- <button type="button" id="flash">刷新</input> -->
                </div>
            </div>
        </div>
     </div>
    <div id="bottom">
    </div>

  </body>
</html>
