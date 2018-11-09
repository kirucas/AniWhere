<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<body>


<script type="text/javascript"> 
function test() { 
var td = document.getElementById("test"); 
var n = Number(td.innerHTML); 
td.innerHTML = n + 1; 
} 


function test2() { 
	var td = document.getElementById("test"); 
	var n = Number(td.innerHTML); 
	td.innerHTML = n - 1; 
	if(n<=2){
		td.innerHTML=1
		
	}
	
	} 
</script> 

<input type="button" value="push" onclick="test()" />
<input type="button" value="back" onclick="test2()" />  

<table border="1"><tr><td id="test"></td></tr></table>

</body>


