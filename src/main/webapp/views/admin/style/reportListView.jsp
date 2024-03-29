<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.common.model.vo.PageInfo, java.util.ArrayList, com.scale.style.model.vo.StyleReport" %>
<%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<StyleReport> list = (ArrayList<StyleReport>)request.getAttribute("list");
    String select = (String)request.getAttribute("select");
    String id = (String)request.getAttribute("id");
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
    .mb-3 button{
        background:black;
        color:white;
    }
    #select{
        width: 100px; 
        height: 30px;
        text-align: center;
        margin-left: 5px;
        border-radius: 0.3em;
    }
    #search{
        border: 1px solid gray; 
        height: 30px;
        border-radius: 0.3em;
        width: 277px;
        margin-left: 20px;
    }
    #search-btn{
        height: 30px;
        border: 1px solid gray; 
        background-color: gray;
        color: white;
        border-radius: 0.3em;
    }

    .table{
        text-align: center;
        font-size:14px;
    }
    .list-row:hover{
        cursor:pointer;
    }
    
    #no{width: 70px;}
    #enroll-date{width: 100px;}
    #reported{width: 100px;}
    #title{
        width: 400px;
        text-overflow:ellipsis; 
    	overflow:hidden;
    	white-space:nowrap;
    }
    #report-date{width: 100px;}
    #reporting{width: 100px;}
    #status{width: 100px;}

    #form-table{
        width: 1000px;
    }
    
    .pagination{
        justify-content: center;
    }

    .answer-filter{
        float:right;
        margin-top:10px;
        font-size:15px;
    }
</style>
</head>
<body>

    <%@ include file="../common/adminMenubar.jsp"%>

    <div class="outer">
        <div class="outer-2">
            <div class="title">
                <h2><b>스타일 신고 관리</b></h2>
                <br>
            </div>
            <div class="list-area">
                <form class="input-group mb-3" style="width:400px" action="<%= contextPath %>/searchreport.ad" method="get">
                    <input type="hidden" name="cpage" value="<%= pi.getCurrentPage() %>">
                    <div id="processing-status">
                        <span>처리현황</span>
                        <select name="select" id="select">
                            <option value="all" id="all">전체</option>
                            <option value="ready" id="ready">신고접수</option>
                            <option value="report" id="report">처리완료</option>
                            <option value="reject" id="reject">반려</option>
                        </select>
                    </div>
                    <br><br>
                    <div>
                        <span>아이디</span>
                        <input type="search" name="id" id="search" required placeholder="피신고자 아이디 검색">
                        <button type="submit" id="search-btn">검색</button>
                    </div>
                </form>
                <div class="answer-filter">
                    <input type="checkbox" id="a-filter">   신고접수만 보기
                </div>

                <script>
                    $(function(){
                        let select = "<%= select %>"
                        $("#select option").each(function(){
                            if($(this).val() == select){
                                $(this).val(select).prop('selected', true);
                            }
                        })

                        let id = "<%= id %>";
                        if(id != "null"){
                            $("#search").val(id);
                        }
                    })

                    $("#a-filter").change(function(){
                        if($(this).is(':checked')){
                            answerFilter(1);
                        }else{
                            location.href = "<%=contextPath%>/stylereport.ad?cpage=1";
                        }
                    })

                    function answerFilter(c){
                        $("tbody").empty();
                        $(".paging-area").empty();
                        let cpage = c;

                        if($(this).attr("checked", true)){
                            $.ajax({
                                url:"<%= contextPath %>/searchReadyReport.ad",
                                data:{"cpage":cpage, "select":0},
                                success:function(map){
                                    let list = map.list;
                                    let pi = map.pi;
                                    let value = "";
                                    let paging = "";
                                    
                                    if(list.length == 0){
                                        value = "<tr class='list-row'><td colspan='6' align='center'>조회된 게시물이 없습니다.</td></tr>";
                                    }else{
                                        for(let i=0; i<list.length; i++){{
                                            switch(list[i].reportCheck) { 
                                                case "0": list[i].reportCheck = "신고접수"; break;
                                                case "1": list[i].reportCheck = "처리완료"; break;
                                                case "2": list[i].reportCheck = "반려"; break;
                                            }

                                            value += "<tr class='list-row'>";
                                            value += "<td>" + list[i].reportNo + "</td>";
                                            value += "<input type='hidden' value='" + list[i].styleNo + "''>";
                                            value += "<td>" + list[i].reportingId + "</td>";
                                            value += "<td>" + list[i].title + "</td>";
                                            value += "<td>" + list[i].reportedDate + "</td>";
                                            value += "<td>" + list[i].reportedId + "</td>";
                                            value += "<td>" + list[i].reportCheck + "</td>";
                                            value += "</tr>";

                                        }}
                                            paging += "<ul class='pagination'>"
                                        if(pi.currentPage != 1){
                                            paging += "<li class='page-item'><a class='page-link' onclick='answerFilter("+(cpage-1)+");'>&lt;</a></li>";
                                        }
                                        for(let i=pi.startPage; i<=pi.endPage; i++){
                                            paging += "<li class='page-item'><a class='page-link' onclick='answerFilter("+i+");'>" + i + "</a></li>";
                                        }

                                        if(pi.currentPage != pi.maxPage && pi.maxPage != 0){
                                            paging += "<li class='page-item'><a class='page-link' onclick='answerFilter("+(cpage+1)+");'>&gt;</a></li>";
                                        }
                                            paging += "</ul>"
                                    }
                                
                                    $("tbody").append(value);
                                    $(".paging-area").append(paging);

                                    $(".table tr:not(:first)").on("click", function(){
                                        let repNo = $(this).children().eq(0).text();
                                        let styleNo = $(this).children().eq(1).val();
                                        location.href = "detailreport.ad?repNo=" + repNo + "&styleNo=" + styleNo + "&cpage=" + cpage;
                                    })

                                    // $(".paging-area>button").each(function(){
                                    //     if($(this).text() == cpage){
                                    //         $(this).addClass("page-active");
                                    //     }
                                    // })
                                            
                                },error:function(){
                                    console.log("미답변 문의 통신 실패");
                                }
                                
                                
                            })
                        }
                        
                    }
                </script>

                <br><br>
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th id="no">번호</th>
                            <th id="reporting">신고자</th>
                            <th id="title">신고제목</th>
                            <th id="report-date">신고일</th>
                            <th id="reported">피신고자</th>
                            <th id="status">처리현황</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(!list.isEmpty()) { %>
                            <% for(int i=0; i<list.size(); i++) { %>
                            <tr class="list-row">
                                <td><%= list.get(i).getReportNo() %></td>
                                <input type="hidden" value="<%= list.get(i).getStyleNo() %>">
                                <td><%= list.get(i).getReportingId() %></td>
                                <td><%= list.get(i).getTitle() %></td>
                                <td><%= list.get(i).getReportedDate() %></td>
                                <td><%= list.get(i).getReportedId() %></td>
                                <% switch(list.get(i).getReportCheck()) { 
                                    case "0": list.get(i).setReportCheck("신고접수"); break;
                                    case "1": list.get(i).setReportCheck("처리완료"); break;
                                    case "2": list.get(i).setReportCheck("반려"); break;
                                } %>
                                <td><%= list.get(i).getReportCheck() %></td>
                            </tr>
                            <% } %>
                        <% } else { %>
                            <tr class="list-row">
                                <td colspan="6" align="center">조회된 게시물이 없습니다.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <br><br>

            <script>
                $(".list-row").on("click", function(){
                    location.href = "detailreport.ad?repNo=" + $(this).children().eq(0).text() + "&styleNo=" + $(this).children().eq(1).val() + "&cpage=" + <%= pi.getCurrentPage() %>;
                });

            </script>

            <!-- 페이징 -->
            <div class="paging-area">
                <% if(select != null) { %>
                    <ul class="pagination">
                        <% if(pi.getCurrentPage() != 1) { %>
                        <li class="page-item">
                            <a class="page-link" href="<%= contextPath %>/searchreport.ad?cpage=<%= pi.getCurrentPage()-1 %>">&lt;</a>
                        </li>
                        <% } %>
                        
                        <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                            <li class="page-item">
                                <a class="page-link" href="<%= contextPath %>/searchreport.ad?cpage=<%= p %>"><%= p %></a>
                            </li>
                        <% } %>
                        
                        <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                            <li class="page-item">
                                <a class="page-link" href="<%= contextPath %>/searchreport.ad?cpage=<%= pi.getCurrentPage()+1 %>">&gt;</a>
                            </li>
                        <% } %>
                    </ul>
                <% } else { %>
                    <ul class="pagination">
                        <% if(pi.getCurrentPage() != 1) { %>
                        <li class="page-item">
                            <a class="page-link" href="<%= contextPath %>/stylereport.ad?cpage=<%= pi.getCurrentPage()-1 %>">&lt;</a>
                        </li>
                        <% } %>
                        
                        <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                            <li class="page-item">
                                <a class="page-link" href="<%= contextPath %>/stylereport.ad?cpage=<%= p %>"><%= p %></a>
                            </li>
                        <% } %>
                        
                        <% if(pi.getCurrentPage() != pi.getMaxPage() && pi.getMaxPage() != 0) { %>
                            <li class="page-item">
                                <a class="page-link" href="<%= contextPath %>/stylereport.ad?cpage=<%= pi.getCurrentPage()+1 %>">&gt;</a>
                            </li>
                        <% } %>
                    </ul>
                <% } %>
            </div>
            <br><br>
        </div>
    </div>
</body>
</html>