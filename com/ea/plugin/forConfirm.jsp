<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<html>
<head>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#b03").click(function(){
		var tn=$('#TABLE_NAME').val();
		var eid=$('#EID').val();
		$.post('eaMain.action', {
						'ACTION_NAME' : 'delrecord',
						'TABLE_NAME'  : tn,
						'EID'  : eid
					}, function(data) {
						$('#myDiv').html(data);
					});
	 	
	});
});
</script>

<title>提交结果</title>
</head>
<body>

	<%@ page import="com.ea.pub.*"%>
	<%@ page import="net.sf.json.JSONObject"%>
	<%@ page import="java.util.*"%>


	<%
	outputDefine myOutD = sysContext.getOutputClass();
	out.println("<form id='eaMain' name='eaMain' action='eaMain.action' method='post'>");

	if (myOutD.getState() == 0) {
		String Error_no = myOutD.getError_Code();
		String Error_msg = myOutD.getError_Message();
		out.println("<br>Error_Code : " + Error_no);
		out.println("<br>Error_Message : " + Error_msg);

	} else {
		int RN = myOutD.getRecordNumber();
		out.println("<input type='hidden' id='TABLE_NAME' name=TABLE_NAME value='"
				+ sysContext.getEnviroment().get("TABLE_NAME")+ "'>");
		out.println("<input type='text' id='EID' name=EID value='"+sysContext.getEnviroment().get("EID")+"'>");
		
		out.println("<br> record number :");
		out.println(RN);
		simpleQueryDefine full = (simpleQueryDefine) myOutD
				.getLinkClass();
		out.println(" <h2>	Title :" + full.getTableCName()
				+ "</h2><br>");

		out.println(" 	total page :" + full.getTotalPage());
		out.println(" 	current page  :" + full.getCurPage());

		out.println("<table border=1>");

		for (int p = 1; p <= full.getTotalPage(); p++) {
			if (p == full.getCurPage())
				out.println(p);
			else
				out.println("<a href='eaMain?ACTION_NAME=DODS&DS_NAME="
						+ full.getTableName() + "&CURRENT_PAGE=" + p
						+ "'>" + p + "</a>");
		}

		if (RN > 0) {
			ArrayList<ArrayList<String>> result = full.getDatas();

			for (int i = 0; i < result.size(); i++) {
				ArrayList<String> Rec = result.get(i);
				out.println("<tr>");
				for (int k = 0; k < Rec.size(); k++) {
					String Value = Rec.get(k);
					out.println("<td align='right'>" + Value + "</td>");
				}
				out.println("</tr>");
			}
		} else			{
			out.println("<tr><td>no record returned<td></tr>");
		}
		out.println("</table>");
		out.println("</form>");
	}
		%>

	<button id="b03" type="button">确认删除</button>
<div id="myDiv"><h4>Query String</h4></div><br>

</body>
</html>