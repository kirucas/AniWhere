<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
$color1: #461467;
$color2: #ffba57;
$color3: lighten(#ff7655, 20%);
$color4: lighten(#00aca0, 10%);
$color5: #8ed3c9;
$color6: darken(#fcf5d8, 20%);

* {
	box-sizing: border-box;
}

body {
	background: #202020;
	font-size: 62.5%;
}

// App
#app {
	overflow: hidden;
	position: absolute;
	left: 0;
	top: 0;
	width: 100vw;
	height: 100vh;
	background: rgba(76,76,76,1);
	background: -moz-linear-gradient(-45deg, rgba(76,76,76,1) 0%, rgba(43,43,43,0.74) 36%, rgba(28,28,28,0.5) 71%, rgba(19,19,19,0.29) 100%);
	background: -webkit-gradient(left top, right bottom, color-stop(0%, rgba(76,76,76,1)), color-stop(36%, rgba(43,43,43,0.74)), color-stop(71%, rgba(28,28,28,0.5)), color-stop(100%, rgba(19,19,19,0.29)));
	background: -webkit-linear-gradient(-45deg, rgba(76,76,76,1) 0%, rgba(43,43,43,0.74) 36%, rgba(28,28,28,0.5) 71%, rgba(19,19,19,0.29) 100%);
	background: -o-linear-gradient(-45deg, rgba(76,76,76,1) 0%, rgba(43,43,43,0.74) 36%, rgba(28,28,28,0.5) 71%, rgba(19,19,19,0.29) 100%);
	background: -ms-linear-gradient(-45deg, rgba(76,76,76,1) 0%, rgba(43,43,43,0.74) 36%, rgba(28,28,28,0.5) 71%, rgba(19,19,19,0.29) 100%);
	background: linear-gradient(135deg, rgba(76,76,76,1) 0%, rgba(43,43,43,0.74) 36%, rgba(28,28,28,0.5) 71%, rgba(19,19,19,0.29) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4c4c4c', endColorstr='#131313', GradientType=1 );
	color: #fff;
}

// Controls
.controls {
	position: absolute;
	left: 50%;
	bottom: 40px;
	transform: translate(-50%, 0);
	width: 100%;
	margin-top: 30px;
	text-align: center;
	padding: 0;
	
	li {
		opacity: 0.6;
		cursor: pointer;
		overflow: hidden;
		display: inline-block;
		height: 30px;
		margin: 0 10px;
		padding: 0 30px;
		border-radius: 10px;
		font: .8rem/30px Arial, sans-serif;
		font-family: 'Ubuntu', Helvetica, Arial, sans-serif;
		background: #505050;
		
		&.active {
			background: lighten(#505050, 40%);
		}
	}
}

// Page
.page {
	position: absolute;
	left: 0;
	top: 0;
	width: 100vw;
	height: 100vh;
	background: #c0c0c0;
	
	.center {
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		width: 100%;
		font-size: 3rem;
		text-align: center;
	}
	
	h1 {
		width: 100%;
		margin: 0;
		padding: 0;
		font-family: 'Ubuntu', Helvetica, Arial, sans-serif;
		font-size: 2.8rem;
		text-transform: capitalize;
	}
	
	p {
		font-family: 'Vollkorn', Georgia, Times, serif;
		font-size: 1.1rem;
	}
	
	a {
		transition: color 200ms ease-out;
		color: darken(rgba(#fff, .8), 40%);
		
		&:hover {
			color: darken(rgba(#fff, .8), 60%);
		}
	}
}

// Active animation
.active-animation {
	position: absolute;
	top: 30px;
	left: 50%;
	transform: translate(-50%, 0);
}

// Page styles
.fade {
	background: $color1;
}

.slide {
	background: $color2;
}

.zoom {
	background: $color3;
}

.flipX {
	background: $color4;
}

.flipY {
	background: $color5;
}

.slideUp {
	background: $color6;
}
</style>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
<script>
//State
const state = {
	animations: 'slide',
	view: 'slide'
}

// Controls
const controls = Vue.component('controls', {
  template: '#controls',
	data: state,
	methods: {
		setView(animation) {
			state.view = animation
		}
	}
})

// Transitions
const slide = Vue.component('slide', {
  template: '#page',
	methods: {
		enter(el, done) {
			const tl = new TimelineMax({
				onComplete: done
			})
			
			tl.set(el, {
				x: window.innerWidth * 1.5,
				scale: 0.8,
				transformOrigin: '50% 50%'
			})
			
			tl.to(el, 0.5, {
				x: 0,
				ease: Power4.easeOut
			});
			
			tl.to(el, 1, {
				scale: 1,
				ease: Power4.easeOut
			});
		},
		leave(el, done) {
			TweenMax.fromTo(el, 1, {
				autoAlpha: 1
			}, {
				autoAlpha: 0,
				ease: Power4.easeOut,
				onComplete: done
			});
		}	
	}
})

// App
const app = new Vue({
  el: '#app',
  data() {
		return state
	}
})
</script>
<!-- App -->
<div id="app">
	
	<component :is="state.view">
		<h1>{{ state.view }}</h1>
	</component>
	<controls></controls>
</div>

<!-- Controls -->
<template id="controls">
	<ul class="controls">
		<li v-for="(animation, index) in state.animations" @click.prevent="setView(animation)" v-bind:class="{ 'active': animation === state.view }">
			{{ animation }}
		</li>
	</ul>
</template>

<!-- Transitions -->
<template id="page">
	<transition 
		v-on:enter="enter" 
		v-on:leave="leave"
		v-bind:css="false"
		appear
	>
		<div class="page" v-bind:class="state.view">
			<div class="center">
				<slot></slot>
			</div>
		</div>
	</transition>
</template>