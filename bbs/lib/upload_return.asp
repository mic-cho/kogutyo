<%
p_url = request.querystring("p_url")
%>
<script type='text/javascript'>
window.parent.SetImage('<%=p_url%>')
</script>