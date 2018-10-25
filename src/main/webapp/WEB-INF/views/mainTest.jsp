<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.drawsvg,
	svg {
	    width: 100%;
	    height: 300px;
	
	}
	
	.stroke {
	    stroke: #000;
	    stroke-width: 1px;
	    stroke-dasharray: 0 250;
	    stroke-opacity: 1;
	    fill: none;
	    -webkit-animation: stroke_offset 8s infinite;
	    animation: stroke_offset 8s infinite;
	    -webkit-animation-timing-function: cubic-bezier(.25, .46, .45, .94);
	    animation-timing-function: cubic-bezier(.25, .46, .45, .94)
	}
	
	@-webkit-keyframes stroke_offset {
	    100%,
	    25% {
	        stroke-dasharray: 0 250;
	        stroke-opacity: 1
	    }
	    50%,
	    75% {
	        stroke-dasharray: 250 0;
	        stroke-opacity: .75
	    }
	    55%,
	    70% {
	        stroke-dasharray: 250 0;
	        stroke-opacity: 0
	    }
	}
	
	@keyframes stroke_offset {
	    100%,
	    25% {
	        stroke-dasharray: 0 250;
	        stroke-opacity: 1
	    }
	    50%,
	    75% {
	        stroke-dasharray: 250 0;
	        stroke-opacity: .75
	    }
	    55%,
	    70% {
	        stroke-dasharray: 250 0;
	        stroke-opacity: 0
	    }
	}
	
	.fill {
	    fill: #000;
	    fill-opacity: 0;
	    -webkit-animation: fill_offset 8s infinite;
	    animation: fill_offset 8s infinite;
	    -webkit-animation-timing-function: cubic-bezier(.25, .46, .45, .94);
	    animation-timing-function: cubic-bezier(.25, .46, .45, .94)
	}
	
	@-webkit-keyframes fill_offset {
	    100%,
	    25%,
	    35%,
	    90% {
	        fill-opacity: 0
	    }
	    50%,
	    70% {
	        fill-opacity: 1
	    }
	}
	
	@keyframes fill_offset {
	    100%,
	    25%,
	    35%,
	    90% {
	        fill-opacity: 0
	    }
	    50%,
	    70% {
	        fill-opacity: 1
	    }
	}
	
	#fade-text {
	    font-family: 'Alex Brush', cursive;
	    font-size: 4em
	}
	
	svg {
	    position: absolute
	}
</style>
<div class="drawsvg">
	<svg version="1.1" viewBox="0 0 700 300">
	  <symbol id="fade-text">
	    <text x="45%" y="40%" text-anchor="middle">I Love ♡</text>
	    <text x="55%" y="60%" text-anchor="middle">cocosoft</text>
	  </symbol>
	  <g>
	    <use class="stroke" xlink:href="#fade-text"/>
	    <use class="fill" xlink:href="#fade-text"/>
	  </g>
	</svg>                  
</div>