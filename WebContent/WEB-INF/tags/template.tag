<%@tag description="Standard Page Template" pageEncoding="UTF-8"%>

<%@attribute name="body" fragment="true" %>

<html>
  <body>
    <div id="header">
      <h1>GlobalHack Project</h1>
    </div>
    <div id="body">
      <jsp:invoke fragment="body"/>
    </div>
    <div id="footer">Footer</div>
  </body>
</html>