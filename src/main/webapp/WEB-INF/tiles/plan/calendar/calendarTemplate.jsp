<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
    <tiles:insertAttribute name="header"/>
<body>
<div class="wrapper">
  <tiles:insertAttribute name="side"/>
<div class="main-panel">
  <tiles:insertAttribute name="nav"/>
  <tiles:insertAttribute name="body"/>
  <tiles:insertAttribute name="footer"/>
</div>
</div>
</body>
</html>