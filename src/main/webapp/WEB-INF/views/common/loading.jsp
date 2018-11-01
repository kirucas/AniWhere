<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/IsMember.jsp"%>

<meta charset="utf-8">

	<style type="text/css">

        .loading {display:none;top:-4px; left:0; z-index:99; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);position: fixed;}

        .loading img {display:block; position:relative; top:50%; margin:-75px auto 0 auto;padding:0 30px;

        border-radius: 10px;

        -webkit-border-radius: 10px;

        -moz-border-radius: 10px;

		box-sizing:border-box;

        background:#fff;

        color:#000; font-size:16px; line-height:50px; text-align:center;
		
        }

    </style>

	<script type="text/javascript">
		$(document).ready(function() {

		    $('.loading').show();

		});
		$(window).on('load', function() {

		    $('.loading').hide();

		}); 
	</script>
	<div class="loading" id="content">

		<img alt="loading" src="<c:url value='/resources/images/loading.gif'/>">

	</div>