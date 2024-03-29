<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.scale.style.model.vo.*, com.scale.common.model.vo.PageInfo, java.net.URLEncoder" %>
<%
	ArrayList<Style> list = (ArrayList<Style>)request.getAttribute("list");
	ArrayList<StyleImg> ilist = (ArrayList<StyleImg>)request.getAttribute("ilist");
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    String select = (String)request.getAttribute("select");
    String keyword = (String)request.getAttribute("keyword");
    String date1 = (String)request.getAttribute("date1");
    String date2 = (String)request.getAttribute("date2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1200px;
        margin:auto;
    }
    .outer-2{float:left; width:80%;}
    .title{
        margin:70px 0px;
    }

    #period{
        width: 90px;
        height: 30px;
        text-align: center; 
        display: inline-block;
        border-radius: 0.3em;
    }
    #standard{
        width: 90px; 
        height: 30px;
        text-align: center;
        border-radius: 0.3em;
    }
    #search{
        border: 1px solid gray; 
        height: 30px;
        border-radius: 0.3em;
        width: 277px;
    }
    #search-btn{
        height: 30px;
        border: 1px solid gray; 
        background-color: gray;
        color: white;
        border-radius: 0.3em;
    }

    .style-img, .carousel{width: 260px; height: 260px; box-sizing: border-box;}
    .style-img img{width: 260px; height: 260px; box-sizing: border-box;}

    .nickname-td{
        width: 150px;
        height: 40px; 
        text-align: left;
    }
    .nickname-td>img{width: 25px; height: 25px;}
    .nickname>span{
        width: 35px;
        margin-left: 3px;
    }
        
    .date-td{width: 110px; text-align: right;}
    .date>a{padding: 0;}

    .content{
        text-overflow:ellipsis; 
    	overflow:hidden;
    	width:260px;
    	white-space:nowrap;
    }
    .tag{
        text-overflow:ellipsis; 
    	overflow:hidden;
    	width:260px;
    	white-space:nowrap;
    }

    #tag-search{width: 300px;}
    #standard>button{margin-left: 5px; margin-right: 5px;}

    #feed>div{
        width: 260px;
        display: inline-block;
        margin: 10px;
    }
    .check{
        zoom: 1.5;
    }

    .paging-area button{
        border:0.5px solid lightgray;
        margin:3px;
    }
    .page-active{
        background:black;
        color:white;
    }
    
    .pagination{
        justify-content: center;
    }
    #nothing{
        width: 1000px;
        font-size: 23px;
        font-weight: bold;
        margin-left: 700px;
        margin-top: 100px;
    }
</style>
</head>
<body>

    <%@ include file="../common/adminMenubar.jsp" %>

    <div class="outer">
        <div class="outer-2">
            <div class="title">
                <h2><b>스타일 피드 관리</b></h2>
            </div>
        </div>

        <form action="<%= contextPath %>/searchStyle.ad" method="get">
            <input type="hidden" name="cpage" value="<%= pi.getCurrentPage() %>">
            <div>
                <div>
                    <div id="period">기간 설정</div>
                    <input type="date" name="date1" id="date1"> - <input type="date" name="date2" id="date2">
                </div>
                <br>
                <select name="select" id="standard">
                    <option value="nickname">닉네임</option>
                    <option value="hashtag">해쉬태그</option>
                </select>
                <input type="search" name="keyword" id="search" required>
                <button id="search-btn" onclick="click(this);">검색</button>
            </div>
        </form>

        <script>
            $(function(){
                let select = "<%= select %>"
                $("#standard option").each(function(){
                    if($(this).val() == select){
                        $(this).val(select).prop('selected', true);
                    }
                })

                let keyword = "<%= keyword %>";
                if(keyword != "null"){
                    $("#search").val(keyword);
                }
            })
        </script>
        
        <form action="<%= contextPath %>/deleteStyle.ad" method="post">
            <input type="hidden" name="cpage" value="<%= pi.getCurrentPage() %>">
            <div align="right">
                <button type="submit" class="btn btn-outline-danger">삭제</button>
            </div>

            <hr>

            <div id="feed">
                <% if(list.isEmpty()){ %>
                    <p id="nothing">조회된 스타일이 없습니다.</p>
                <% } %>
                <% for(int i=0; i<list.size(); i++) { %>
                <div>
                    <input type="checkbox" class="check" name="styleNo" value="<%= list.get(i).getStyleNo() %>">
                    <table class="set">
                        <tr>
                            <td colspan="2" class="style-img">
                                <div id='demo<%= i %>' class='carousel' data-interval='false'>
                                    <div class='carousel-inner'>
                                    <% for(int j=0; j<ilist.size(); j++) { %>
                                        <% if(list.get(i).getStyleNo() == ilist.get(j).getStyleNo() && ilist.get(j).getFileLevel() == 1) { %>
                                            <div class='carousel-item active'>
                                                <img class='cimg' src='<%= contextPath %>/<%= ilist.get(j).getFilePath() %>/<%= ilist.get(j).getChangeName() %>' onclick='detail(this);'>
                                                <input type="hidden" value="<%= list.get(i).getStyleNo() %>">
                                                <input type="hidden" value="<%= pi.getCurrentPage() %>">
                                            </div>
                                        <% } else if(list.get(i).getStyleNo() == ilist.get(j).getStyleNo() && ilist.get(j).getFileLevel() == 2) { %>
                                            <div class='carousel-item'>
                                                <img class='cimg' src='<%= contextPath %>/<%= ilist.get(j).getFilePath() %>/<%= ilist.get(j).getChangeName() %>' onclick='detail(this);'>
                                                <input type="hidden" value="<%= pi.getCurrentPage() %>">
                                            </div>
                                        <% } %>
                                    <% } %>
                                    </div>
                                    <a class="carousel-control-prev" href="#demo<%= i %>" data-slide="prev">
                                        <span class="carousel-control-prev-icon"></span>
                                    </a>
                                    <a class="carousel-control-next" href="#demo<%= i %>" data-slide="next">
                                        <span class="carousel-control-next-icon"></span>
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="nickname-td">
                                <img src="<%= contextPath %>/<%= list.get(i).getProfileImg() %>" class="rounded-circle">
                                <span href=""><%= list.get(i).getStyleWriter() %></span>
                            </td>
                            <td class="date-td">
                                <span><%= list.get(i).getEnrollDate() %></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="content-td">
                                <div class="content"><%= list.get(i).getContent() %></div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="tag">
                                <% if(list.get(i).getHashtag() != null) { %>
                                    <% String[] tagArr = list.get(i).getHashtag().split(" "); %>
                                    <% for(int t=0; t<tagArr.length; t++) { %>
                                        <span><%= tagArr[t] %></span>
                                    <% } %>
                                <% } %>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <% } %>
            </div>
        </form>

        <br>

            <% if(select != null) { %>
                <ul class="pagination">
                    <% if(pi.getCurrentPage() != 1) { %>
                    <li class="page-item">
                        <a class="page-link" href="<%= contextPath %>/searchStyle.ad?cpage=<%= pi.getCurrentPage()-1 %>&keyword=<%= keyword %>&select=<%= select %>&date1=<%= date1 %>&date2=<%= date2 %>">&lt;</a>
                    </li>
                    <% } %>
                    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                        <li class="page-item">
                            <a class="page-link" href="<%= contextPath %>/searchStyle.ad?cpage=<%= p %>&keyword=<%= keyword %>&select=<%= select %>&date1=<%= date1 %>&date2=<%= date2 %>"><%= p %></a>
                        </li>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                        <li class="page-item">
                            <a class="page-link" href="<%= contextPath %>/searchStyle.ad?cpage=<%= pi.getCurrentPage()+1 %>&keyword=<%= keyword %>&select=<%= select %>&date1=<%= date1 %>&date2=<%= date2 %>">&gt;</a>
                        </li>
                    <% } %>
                </ul>
            <% } else { %>
                <ul class="pagination">
                    <% if(pi.getCurrentPage() != 1) { %>
                    <li class="page-item">
                        <a class="page-link" href="<%= contextPath %>/stylelist.ad?cpage=<%= pi.getCurrentPage()-1 %>">&lt;</a>
                    </li>
                    <% } %>
                    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                        <li class="page-item">
                            <a class="page-link" href="<%= contextPath %>/stylelist.ad?cpage=<%= p %>"><%= p %></a>
                        </li>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                        <li class="page-item">
                            <a class="page-link" href="<%= contextPath %>/stylelist.ad?cpage=<%= pi.getCurrentPage()+1 %>">&gt;</a>
                        </li>
                    <% } %>
                </ul>
            <% } %>
        
        <br><br>
    </div>

    <script>
        function detail(e){
            location.href = "<%= contextPath %>/detailStyle.ad?no=" + $(e).next().val() + "&cpage=" + $(e).next().next().val();
        }

        $("button[type='submit']").click(function(){
            if($(".check").is(':checked') == false){
                alert("삭제할 스타일을 선택해주세요.");
                $("form").attr("action", "");
            }
        })

       function click(e){
            if($("#search").val() == ""){
                alert("검색어를 입력해주세요.");
            } else {
                let keyword;
                if($("#search").val().charAt(0) == '#'){
                    keyword = $("#search").val().substring(1);
                } else {
                    keyword = $("#search").val();
                }
            }
       }
    </script>

</body>
</html>