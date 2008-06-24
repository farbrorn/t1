<%-- 
    Document   : printkundinfo
    Created on : 2008-jun-16, 19:42:28
    Author     : ulf
--%>
<%@ page import="se.saljex.sxserver.SXUtil" %>
<%@ page import="se.saljex.sxserver.web.*" %>
 <script type="text/javascript" src="sxdoclib.js"></script>

 <script type="text/javascript">
$(document).ready(function() {
		 $(".docgrupp").hide();
});
		 
 </script> 

<% 
SXSession sxSession = WebUtil.getSXSession(session);

PageListBetjour pl = (PageListBetjour)request.getAttribute("pagelistbetjour");

String divInfo = (String)request.getAttribute("divinfo");
if (divInfo == null) divInfo = "";
%>
<div <%= divInfo %>>

<h1>Betalningar</h1>

<%
if (pl == null) { out.println("Inga data"); } else { %>
<table id="doclist">
	<tr>
		<th class="tdknapp"></th>
		<th class="tddatum">Betaldatum</th>
		<th class="tdn12">Fakturanr</th>
		<th class="tds10">Betals�tt</th>
		<th class="tdn14">Belopp</th>
		 <th></th>
	</tr>
<%
int radcn = 0;
while (pl.next()) {
	radcn++;
	if (radcn % 2 > 0) { %> <tr id="tr<%= radcn %>" class="trdocodd"> <%} else { %><tr id="tr<%= radcn %>" class="trdoceven"> <%}
%>

<td class="tdknapp"><a href="JavaScript:showfaktura(<%= radcn %>,<%= pl.getFaktnr() %>)" name="a<%= radcn %>">Visa</a></td>
<td class="tddatum"><%= SXUtil.getFormatDate(pl.getBetdat()) %></td>
<td class="tdn12"><%= pl.getFaktnr() %></td>
<td class="tds10"><%= pl.getBetsatt() %></td>
<td class="tdn14"><%= SXUtil.getFormatNumber(pl.getBet()) %></td>
<td></td>
</tr>
<tr><td colspan="6"><div id="f<%= radcn %>" class="docgrupp" ></div></td></tr>	
<%
}
%>
</table>
<%
}
%>
	
</div>