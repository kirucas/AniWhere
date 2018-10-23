<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
//U01TX0FVVEgyMDE4MTAxNTIxMzIwODEwODIzNjM=   //api키
/* 주소 API 적용 시작 */
 
    // 주소 검색
    function Search_Post_API(PageNo) {
 
        var intPageSize = 10;
        var intTotalPages = 0;
 
        // 검색API URL은 프로토콜(http/https) 맞춰서 설정한다.
        var strUrl = window.location.protocol + "//www.juso.go.kr/addrlink/addrLinkApiJsonp.do";
        
        if (!searchJuso()) {
            try {
                $.ajax({
                    url: strUrl
                    , type: "post"
                    , data: ({ currentPage: PageNo, countPerPage: intPageSize, keyword: $("#txt_SearchText").val(), confmKey: $("#hid_Key").val() })
                    , dataType: "jsonp"
                    , crossDomain: true
                    , success: function (xmlStr) {
 
                        if (navigator.appName.indexOf("Microsoft") > -1) {
                            var xmlData = new ActiveXObject("Microsoft.XMLDOM");
                            xmlData.loadXML(xmlStr.returnXml)
                        } else {
                            var xmlData = xmlStr.returnXml;
                        }
 
                        var errCode = $(xmlData).find("errorCode").text();
                        var errDesc = $(xmlData).find("errorMessage").text();
                        var PostList = "";
 
                        if (errCode == "0") {
                            if (xmlStr != null) {
 
                                PostList += "<p><strong>" + $(xmlData).find("totalCount").text() + "개</strong>의 주소가 검색되었습니다.</p>";
 
                                PostList += "<ul>";
 
                                $(xmlData).find("juso").each(function (i) {
                                    PostList += "<li>";
                                    PostList += "<a href=\"javascript:SetOpenerValue('" + $(xmlData).find("zipNo").eq(i).text() + "', '" + $(xmlData).find("roadAddr").eq(i).text().replace("'"," ") + "');\">";
                                    PostList += "<em>" + $(xmlData).find("zipNo").eq(i).text() + "</em>";
                                    PostList += "<span>" + $(xmlData).find("roadAddr").eq(i).text() + "<br/>" + $(xmlData).find("jibunAddr").eq(i).text() + "</span>";
                                    PostList += "</a>";
                                    PostList += "</li>";
                                });
 
                                PostList += "</ul>";
 
                                $("#dvSearchArea").html(PostList);
 
                                // 페이징
                                if ($(xmlData).find("totalCount").text() != 0) {
                                    intTotalPages = Math.ceil($(xmlData).find("totalCount").text() / intPageSize);
                                    $("#div_paginate").html(PageLink(PageNo, intTotalPages, "Search_Post_API"));
                                }
 
                            }
                        } else if (errCode == "E0005") {
                            alert("검색어를 입력해주세요.");
                        } else if (errCode == "E0006") {
                            alert("주소를 상세히 입력해주세요.");
                        } else { // 에러발생시 주소DB 호출
                            ErrorJuso();
                        }
                    }
                    , error: function (xhr, status, error) {
                        ErrorJuso();
                    }
                });
            } catch (e) {
                ErrorJuso();
            }
        }
        return;
    }
 
    // 검색 API 서비스 오류
    function ErrorJuso() {
        alert("에러발생 시 코드 작성");
    }
 
    // 검색 API 호출 전 검색어 체크
    function searchJuso() {
        if (!checkSearchedWord($("#txt_SearchText").val().toUpperCase())) {
            return true;
        } else {
            return false;
        }
    }
 
    // 특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
    function checkSearchedWord(obj) {
 
        if (obj != null && obj != "") {
 
            //특수문자 제거
            var expText = /[%=><+!^*]/;
            if (expText.test(obj) == true) {
                alert("특수문자를 입력 할수 없습니다.");
                $("#txt_SearchText").val(obj.replace(expText, ""));
                return false;
            }
 
            //특정문자열(sql예약어의 앞뒤공백포함) 제거
            var sqlArray = new Array("AND", "OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "ALTER", "DROP", "EXEC", "UNION", "FETCH", "DECLARE", "TRUNCATE", "SHUTDOWN");
 
            for (var i = 0; i < sqlArray.length; i++) {
                if (obj.match(sqlArray[i])) {
                    alert(sqlArray[i] + "와(과) 같은 특정문자로 검색할 수 없습니다.");
                    $("#txt_SearchText").val(obj.replace(sqlArray[i], ""));
                    return false;
                }
            }
        }
        return true;
    }
 
    // 임시 페이징
    function PageLink(curPage, totalPages, funName) {
 
        pageUrl = "";
 
        var pageLimit = 5;
        var startPage = parseInt((curPage - 1) / pageLimit) * pageLimit + 1;
        var endPage = startPage + pageLimit - 1;
 
        if (totalPages < endPage) {
            endPage = totalPages;
        }
 
        var nextPage = endPage + 1;
 
        if (curPage > 1 && pageLimit < curPage) {
            pageUrl += "<a class='first' href='javascript:" + funName + "(1);'><img src='/images_new/common/2016/btn_paging_first.gif' alt='처음' /></a>";
        }
        if (curPage > pageLimit) {
            pageUrl += " <a class='prev' href='javascript:" + funName + "(" + (startPage == 1 ? 1 : startPage - 1) + ");'><img src='/images_new/common/2016/btn_paging_prev.gif' alt='이전' /></a>";
        }
 
        for (var i = startPage; i <= endPage; i++) {
            if (i == curPage) {
                pageUrl += " <a href='#'><strong>" + i + "</strong></a>"
            } else {
                pageUrl += " <a href='javascript:" + funName + "(" + i + ");'> " + i + " </a>";
            }
        }
 
        if (nextPage <= totalPages) {
            pageUrl += "<a class='next' href='javascript:" + funName + "(" + (nextPage < totalPages ? nextPage : totalPages) + ");'><img src='/images_new/common/2016/btn_paging_next.gif' alt='다음' /></a>";
        }
        if (curPage < totalPages && nextPage < totalPages) {
            pageUrl += "<a class='last' href='javascript:" + funName + "(" + totalPages + ");'><img src='/images_new/common/2016/btn_paging_last.gif' alt='끝' /></a>";
        }
 
        return pageUrl;
    }
  
    /* 주소 API 적용 끝 */
 
</script>
   
<input type="hidden" id="hid_Key" value="U01TX0FVVEgyMDE4MTAxNTIxMzIwODEwODIzNjM="/> <!-- 검색API Key -->

<label for="inptxt3">검색어</label><input type="text" id="txt_SearchText"/>
<img src="<c:url value='/resources/images/maketimages/look.jpg'/>" style="width:30px;height:30px" alt="검색" onclick="javascript:Search_Post_API('1');" />

<div id="dvSearchArea" class="cresultArea"></div>
<div id="div_paginate" class="paginate"></div>



