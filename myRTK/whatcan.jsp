<%--
	Document   : info
	Created on : Apr 13, 2010, 3:43:37 PM
	Author     : BellFeinsD
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.naming.Context,
	javax.naming.InitialContext,
	java.lang.Boolean,java.sql.*,
	java.lang.Object,java.io.*,
	java.net.URLEncoder,
	java.util.*,
	java.text.SimpleDateFormat,
	java.text.DecimalFormat,
	java.util.HashMap" %>
<%@ include file="langpage.jsp" %>
<% 		
String containFramesHeader ="";
StringBuffer Url = request.getRequestURL();
if(request.getParameter("containFrame") !=null)
{
  containFramesHeader = request.getParameter("containFrame");
}
String containFrames="No";
if(containFramesHeader.indexOf("containFrames") != -1)
{
	containFrames ="Yes";
}
	String ua = request.getHeader( "User-Agent" );
	boolean isBlackberry = ( ua != null && ua.indexOf( "BlackBerry" ) != -1 );
	
	boolean isFirefox = ( ua != null && ua.indexOf( "Firefox/" ) != -1 );
	boolean isChrome = ( ua != null && ua.indexOf( "Chrome/" ) != -1 );
	boolean isSafari = ( ua != null && ua.indexOf( "Safari/" ) != -1 && ua.indexOf( "iPhone" ) == -1);
	boolean isMSIE = ( ua != null && ua.indexOf( "MSIE" ) != -1 );
	boolean isOpera = ( ua != null && ua.indexOf( "Opera" ) != -1 );
	
	boolean isIphone = (ua != null && ua.indexOf( "iPhone" ) != -1 );
	boolean isAndroid = (ua != null && ua.indexOf( "Android" ) != -1 );
	boolean DS1 = false;
	boolean DS2 = false;
	boolean DS3 = false;
	boolean DS4 = false;
	if(isIphone || isAndroid) {
		DS1 = true;
	} else if(isFirefox || isChrome || isMSIE || isSafari || isOpera) {
		DS2 = true;
	} else if(isBlackberry) {
		DS3 = true;
	} else {
		DS4 = true;
	}
	
	response.setHeader( "Vary", "User-Agent" );
	String title =whatcando;
	String nav = "";
	if(DS1) { nav = "navigation"; } else { nav="portalMenu-tabs"; }
%>
<% if(containFrames=="No") { %>	
<%@ include file="top.jsp" %>
<% } %>	
  <!--
	<meta name="DC.description" content="myRTK is an EPA website designed for mobile devices. For any address, the map displays nearby facilities regulated under federal environmental laws. Facility reports provide summaries of chemical/pollutant releases, chemical effects, and compliance history from numerous data systems." />

	<meta name="keywords" content="myRTK, TRI, Toxics Release Inventory, Community Right to Know, EPA mobile web, toxic releases, chemical releases, chemical health effects,  enforcement, compliance, compliance history, violations, detailed facility report, inspections, environmental performance" />

	<meta name="DC.Subject" content="myRTK, TRI, Toxics Release Inventory, Community Right to Know, EPA mobile web, toxic releases, chemical releases, chemical health effects,  enforcement, compliance, compliance history, violations, detailed facility report, inspections, environmental performance" />
	
	<title>myRTK - <%=whatcando%></title>
	-->
	<link rel="icon" type="image/png" href="favicon.png" />
	
	<% if(DS1) { %>
		<style type="text/css" media="screen">@import 'css/ds1.css';</style>
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
		<meta name="format-detection" content="telephone=no" />
		<link rel="apple-touch-icon" href="index.png" />
	<% } else  if(DS2) { %>
		<style type="text/css" media="screen">@import 'css/ds2.css';</style>
	<% } else if(DS3) { %>
		<style type="text/css" media="screen">@import 'css/ds3.css';</style>
		<meta name="HandheldFriendly" content="True" />
		
	<% } else { %>
		<style type="text/css" media="screen">@import 'css/ds4.css';</style>
	<% } %>
	<script type="text/javascript" src="js/cookies.js"></script>
	<script type="text/javascript" src="js/core.js"></script>
	
	<script type="text/javascript" src="js/gears_init.js"></script>
	<script type="text/javascript" src="js/geolocate.js"></script>
<!-- InstanceEndEditable -->
<!-- InstanceParam name="bodyClass" type="text" value="apps" -->


</head>

<body class="apps">
<% if(containFrames=="No") { %>	
<%@ include file="justbanner.jsp" %>
<% } %>	
	<% if( DS2) { %>
	<div id="content">
	<% } %>
		<% String srchtab="" ;
		String listtab="" ;
		String maptab="" ;
		String infotab="" ;
		String info2tab="" ;
		%>
		<% if( DS2) { %>
        <%  srchtab="" ;
		 listtab="" ;
		 maptab="" ;
		 infotab="style=\"background: url(images/tab-right-current.gif)\"" ;
		info2tab="" ;
	%>
	<% } %>
	<% if( DS1||DS3) {  %>
	<% srchtab="" ;
		listtab="" ;
		maptab="" ;
		infotab="class=\"active\"" ;
		info2tab="" ;
	%>
	<% } %>
	<% if(containFrames=="No") { %>	
		 <%@ include file="toplinks.jsp" %>
		 <% } %>	
	<% if( DS1||DS3) { %>
	<div id="content">
	<% } %>
	
		<a <%=srchtab%> href="index.jsp?containFrame=containFrames"><u><%=search%></u></a><br/>
	
		<b><%=title%></b>
		<p><%=basedwiderange%>:</p>

		<p><a href="http://www.epa.gov/compliance/complaints/index.html"><u><%=reportpotviol%></u>.</a></p>
		<hr>

		<p><%=reportoil%>.</p>
		<hr>
		<p><%=yourlocalemer%>.</p>
		<hr>
		<p><a href="http://www.ecos.org/section/states"><u><%=yourstateoff%></u>.</a> </p>
		<hr>
		<p><a href="http://www.epa.gov/epahome/regions.htm"><u><%=epareg%></u></a> </p>
		<hr>
		<p><a href="http://www.osha.gov/html/RAmap.html"><u><%=offoccsafe%></u>.</a> </p>
		<hr>
		<p><a href="http://oaspub.epa.gov/enviro/ets_grab_error.smart_form?P_CALLER_URL=http://www.epa.gov/epahome/comments.htm"><u><%=epaerror%></u>.</a> </p> 
<% if(DS1) { %>
		<div class="back"><a href="#" onclick="return_referrer()">&laquo; <%=back1%></a></div>
	<% } %>
	</div>
	<% if(containFrames=="No") { %>	
	<%@ include file="abovefooter.jsp" %>
		<div id="footer">
  			<p><a id="feedback_menu" href="http://m.epa.gov/privacy.html">Privacy</a><span class="key">[+]</span><a id="contact_menu" href="http://m.epa.gov/contact/index.html" accesskey="+">Contact</a><span class="key">[#]</span><a href="http://www.epa.gov/?m_rd=false" accesskey="#" title="EPA.gov Full Site">EPA.Gov</a><a id="desktop" href="http://www.epa.gov/?m_rd=false">Full site</a></p>
		</div>
	<% } %>
	<script type="text/javascript">
		window.scrollTo(80, 0);
	</script>
<% if(containFrames=="No") { %>	
	<%@ include file="bottom.jsp" %>
	<% } %>