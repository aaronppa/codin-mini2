<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${pageResult.count != 0}">
		<nav>
		  <ul class="pagination">
	        <li <c:if test="${!pageResult.prev }">class="disabled"</c:if> >
		      <a href="${pageResult.beginPage-1}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li> 
		    

			<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
		    	<li <c:if test="${i eq pageResult.pageNo }">class="active"</c:if> ><a href="${i}">${i}</a></li>
			</c:forEach>

		    <li <c:if test="${!pageResult.next }">class="disabled"</c:if> >
		      <a href="${pageResult.endPage+1 }" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>			
	</c:if>

	<script>
		console.log(${pageResult.beginPage})
		console.log(${pageResult.endPage})
	</script>