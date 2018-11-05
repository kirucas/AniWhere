<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>

    <div class="swiper-container">

        <ul class="swiper-wrapper">

           <%--  <li class="swiper-slide" style="background:url(<c:url value=''/>) center center / cover no-repeat;" data-left="0"></li> --%>
            <li class="swiper-slide" style="background:url(/images/main/visual03.jpg) center center / cover no-repeat;" data-left="1"></li>
            <li class="swiper-slide" style="background:url(/images/main/visual02.jpg) center center / cover no-repeat;" data-left="0"></li>
            <li class="swiper-slide" style="background:url(/images/main/visual04.jpg) center center / cover no-repeat;" data-left="1"></li>
            <li class="swiper-slide" style="background:url(/images/main/visual05.jpg) center center / cover no-repeat;" data-left="1"></li>
        </ul>

        <div class="swiper-pagination"></div>
        <!-- navigation buttons -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

    </div>
<script>
$(document).ready(function(){
    //initialize swiper when document ready
    var mySwiper = new Swiper ('.swiper-container', {
        // Optional parameters
        //direction: 'vertical',
        effect: 'fade',
        speed: 2500,
        crossEffect: { crossFade: true },
        autoplay: true,
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-container .swiper-pagination',
            clickable: true,
        },
        on: {
            init: function(){
                //console.log("slide init");
                //console.log(this.$wrapperEl[0]);
                var slide = $(this.$wrapperEl[0]).find(".swiper-slide-active");
                var bg = slide.data("left");
                if(bg=="1") {
                    $("header").addClass("bg-white");
                } else {
                    $("header").removeClass("bg-white");
                }
            },
        },
    });

    mySwiper.on('slideChange', function(){
        //console.log("slide change");
        //console.log(mySwiper.realIndex);
        var r_idx = mySwiper.activeIndex;
        var slide = mySwiper.slides[r_idx];
        //console.log(mySwiper.$wrapperEl);
        //console.log($(slide));
        var bg = $(slide).data("left");
        //console.log("r_idx=" + r_idx + ", bg=" + bg + ", src=" + $(slide).css("background"));
        if(bg=="1") {
            $("header").addClass("bg-white");
        } else {
            $("header").removeClass("bg-white");
        }
    });
});

$(document).ready(function(){
    var mySwiper = new Swiper ('.swiper-container', {
        // Optional parameters
        //direction: 'vertical',
        effect: 'fade',
        speed: 2500,
        crossEffect: { crossFade: true },
        autoplay: true,
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-container .swiper-pagination',
            clickable: true,
        },
    });

});

</script>