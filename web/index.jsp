<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Welcome</title>
  </head>
  <body>
  <h3> INDEX PAGE </h3>
  <table>
    <tr>
      <th>Action</th>
      <th>Go to Link</th>
    </tr>
    <tr>
      <td>Customer List</td>
      <td> <a href="${pageContext.request.contextPath}/customer/list">       Go</a></td>
    </tr>
  </table>
  </body>
</html>
