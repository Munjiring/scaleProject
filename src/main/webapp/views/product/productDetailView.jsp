<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.scale.product.model.vo.*, java.util.ArrayList, com.scale.bidding.model.vo.Bidding, java.text.DecimalFormat" %>
<%@ page import="com.scale.style.model.vo.*" %>
<% 
	Product p = (Product)request.getAttribute("p");
	ArrayList<Bidding> dList = (ArrayList<Bidding>)request.getAttribute("dList");
	ArrayList<ProductImg> pImgList = (ArrayList<ProductImg>)request.getAttribute("pImgList");
	ArrayList<Bidding> bList = (ArrayList<Bidding>)request.getAttribute("bList");
	ArrayList<Bidding> sList = (ArrayList<Bidding>)request.getAttribute("sList");
	int likeCount = (int)request.getAttribute("likeCount");
	int userLike = (int)request.getAttribute("userLike");
	ArrayList<Style> st = (ArrayList<Style>)request.getAttribute("st");
	ArrayList<StyleImg> iList = (ArrayList<StyleImg>)request.getAttribute("iList");
	DecimalFormat formatter = new DecimalFormat("###,###");
%> 
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{
            /*border: 1px solid red;*/ 
            box-sizing: border-box;
        }
        .line{
            border: 0.1px solid lightgray;
            width: 700px;
            margin: auto;
        }
        .outer{
            width: 1200px;
            margin: auto;
        }
        .product-header{
            width: 100%;
            height: 900px;
        }
        #product-img, #product-info{
            float: left;
            height: 100%;
        }
        #product-img{width: 40%;}
        #product-info{width: 60%;}
        #product-info>div{width : 100%;}
        #product-img img{
            width: 450px;
        }
        
        #product-deal button{
            width: 100%;
            font-size: 12px;
        }

        #product-deal button th{
            font-size: 15px;
        }


        #product-like button{
            width: 100%;
            height: 30px;
        }
        
        #product-info-detail td{
            font-size: 12px;
            color: gray;
        }
        .price-detail th{
            width: 30%;
        }
        .price-detail td{
            padding-left: 15px;
            padding-right: 25px;
        }
        .modalList{
            height: 280px;
        }
        .view-more{
            width: 100%;
        }

        .product-footer{
            width: 100%;
         
        }
        #style-preview{
            width: 100%;
        }
        #style-preview td{
            width: 25%;
        }
        #style-preview img{
            width: 100%;
            padding: 20px;
        }
        #style-preview th{
            padding-top: 10px;
            padding-left: 25px;
        }
        #style-preview tbody td{
            padding-left: 25px;
            font-size: 12px;
            color: gray;
        }
        .product-info{height: 150px; padding-left: 30px; padding-top: 15px;}
        .product-info img{width: 130px;}
        #product-brand{font-weight: bold;}
        #product-eng-name{font-size: 14px;}
        #product-kor-name{
            font-size: 14px;
            color: gray;
        }
        .viewMoreRadio{width: 100%;}
        .product-detail-title{
            width: 25%;
            color: rgb(99, 99, 99);
            font-size: 13px;
        }
        #style-preview img{
            width: 300px;
            height: 300px;
            
        }
        #style-preview td{
        	width: 300px;
        }
        .carousel-control-prev-icon { 
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E"); 
        }
        .carousel-control-next-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E"); 
        }
        .modal-content{
            height: 600px;
        }
        .modal-dialog{
            max-width: 1000px;
        }
        #product-eng-name, #product-kor-name{
            width: 280px;
            text-overflow:ellipsis; 
            overflow:hidden;
            white-space:nowrap;
        }
        .noStyle{
        	height: 300px
        }
        
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <script>
        $(function(){
            <% if(loginUser != null && loginUser.getShopBlockDate() != null) { %>
                alert("????????? ???????????? SHOP ?????????????????????.");
                location.href = "<%= contextPath %>";
            <% } %>
        })
    </script>
    <div class="outer">
        <div class="product-header">
            <br><br>
            <div id="product-img">
                <div id="demo" class="carousel" data-ride="carousel">

                    <!-- Indicators -->
                    <ul class="carousel-indicators">
                      <li data-target="#demo" data-slide-to="0" class="active"></li>
                      <li data-target="#demo" data-slide-to="1"></li>
                      <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                  
                    <!-- The slideshow -->
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="<%= contextPath %>/<%= p.getProductImgM() %>">
                      </div>
	                      <% if(pImgList != null && pImgList.size() != 0) { %>
		                      <% for (ProductImg pi : pImgList) { %>
			                      <div class="carousel-item">
			                        <img src="<%= contextPath %>/<%= pi.getFilePath() %>">
			                      </div>
		                      <% } %>
	                      <% } %>
                    </div>
                  
                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                      <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                      <span class="carousel-control-next-icon"></span>
                    </a>
                  
                  </div>
            </div>
            <div id="product-info">
                <div id="product-name">
                    <h3><%= p.getBrandName() %></h3>
                    <h4><%= p.getProductNameEng() %></h4>
                    <h6><%= p.getProductNameKo() %></h6>
                </div>
                <div id="product-detail">
                    <div id="detail-header">
                        <table id="product-deal">
                            <tr>
                                <td style="width: 360px;">?????????</td>
                                <td style="width: 360px;">
                                    <div align="right">
                                        <select name="pSize" id="pSize" style="width: 120px;" onchange="ajaxSelectSizeResult();">
                                            
                                        </select>
                                    </div>
                                    <script>
		                            	$(function(){
		                            		var arr = "<%= p.getProductSize() %>".split(", ");
		                            		var sizeOption = "<option value='allSize'>?????? ?????????</option>";
		                            		for(let i=0; i<arr.length; i++){
		                            			sizeOption += "<option value='" + arr[i] + "'>" + arr[i] + "</option>"
		                            		}
		                            		$("#pSize").html(sizeOption);
		               
		                            	})
		                            </script>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 30px;"><div class="line"></div></td>
                            </tr>
                            <tr>
                                <th>???????????????</th>
                                <th>
                                	<div align="right">
                                		<% if(dList != null && dList.size() != 0) { %>
                                			<%= formatter.format(dList.get(0).getbPrice()) %> ???
                                		<% } else{ %>
                                			- ???
                                		<% } %>
                                	</div>
                                </th>
                            </tr>
                            <tr><td colspan="2"><div><br></div></td></tr>
                            <tr>
                                <td>
                                    <button type="button" id="buy-btn" class="btn btn-warning" onclick="buy();">
                                        <table>
                                            <tr>
                                                <th rowspan="2" width="150">??????</th>
                                                <td width="100">
                                                	<% if(sList != null && sList.size() != 0) { %>
			                                			<%= formatter.format(sList.get(0).getbPrice()) %>???
			                                		<% } else{ %>
			                                			-
			                                		<% } %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>????????????</td>
                                            </tr>
                                        </table>
                                    </button>
                                </td>
                                <td>
                                    <button type="button" id="sell-btn" class="btn btn-success" onclick="sell();">
                                        <table>
                                            <tr>
                                                <th rowspan="2" width="150">??????</th>
                                                <td width="100">
                                                	<% if(bList != null && bList.size() != 0) { %>
			                                			<%= formatter.format(bList.get(0).getbPrice()) %>???
			                                		<% } else{ %>
			                                			-
			                                		<% } %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>????????????</td>
                                            </tr>
                                        </table>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2" id="product-like">
                                    <% if(loginUser == null || userLike == 0) { %>
                                    	<button type="button" id="like-button" class="btn btn-secondary" onclick="like();"><span class="like">???</span>??? | <span class="likeCount"><%= likeCount %></span>
                                    <% } else { %>
                                    	<button type="button" id="like-button" class="btn btn-secondary" onclick="like();"><span class="like">???</span>??? | <span class="likeCount"><%= likeCount %></span>
                                    <% } %>
                                </th>
                            </tr>
                        </table>
                    </div>
                    <script>
                        function buy(){
                            <% if(loginUser == null) { %>
                                alert("????????? ??? ??????????????? ??????????????????.");
                                location.href = "<%= contextPath %>/loginForm.us";
                            <% } else if(loginUser != null && loginUser.getShopBlockDate() != null) { %>
                                alert("????????? ???????????? SHOP ?????????????????????.");
                                location.href = "<%= contextPath %>"; 
                            <% } else { %>
                                location.href='<%= contextPath %>/buy.bi?co=<%= p.getProductCode() %>';        
                            <% } %>
                                
                        }
                        function sell(){
                            <% if(loginUser == null) { %>
                                alert("????????? ??? ??????????????? ??????????????????.");
                                location.href = "<%= contextPath %>/loginForm.us";
                            <% } else if(loginUser != null && loginUser.getShopBlockDate() != null) { %>
                                alert("????????? ???????????? SHOP ?????????????????????.");
                                location.href = "<%= contextPath %>"; 
                            <% } else { %>
                                location.href='<%= contextPath %>/sell.bi?co=<%= p.getProductCode() %>';
                            <% } %>  
                        }

                        function like(){
                            <% if(loginUser == null) { %>
                                alert("????????? ??? ??????????????? ??????????????????.");
                                location.href = "<%= contextPath %>/loginForm.us";
                            <% } else { %>
                                $.ajax({
                                    url: "<%= contextPath %>/plike.pd",
                                    data:{
                                        userNo: <%= loginUser.getUserNo() %>,
                                        pCode: <%= p.getProductCode() %>
                                    },
                                    success:function(countLike){
                                        if($(".like").text() == "???"){
                                            $(".like").text("???");
                                        } else{
                                            $(".like").text("???");
                                        }
                                        $(".likeCount").text(countLike);
                                        
                                    },   
                                    error:function (){  
                                      alert("????????? ajax ?????? ??????");                  
                                    }
                                  
                                })
                            <% } %>  
                        }
                    </script>
                    <br>
                    <div id="detail-body">
                        <table id="product-info-detail" width="100%">
                            <tr>
                                <th colspan="4" style="font-size:17px">????????????</th>
                            </tr>
                            <tr>
                                <td colspan="4"><br><div class="line"></div></td>
                            </tr>
                            <tr>
                                <th class="product-detail-title" style="width: 25%;">????????????</th>
                                <th class="product-detail-title" style="width: 25%;">?????????</th>
                                <th class="product-detail-title" style="width: 25%;">??????</th>
                                <th class="product-detail-title" style="width: 25%;">?????????</th>
                            </tr>
                            <tr>
                                <td><%= p.getModelCode() %></td>
                                <td><%= p.getReleaseDate() %></td>
                                <td><%= p.getColor() %></td>
                                <td><%= formatter.format(p.getReleasePrice()) %>???</td>
                            </tr>
                            <tr>
                                <td colspan="4"><div class="line"></div></td>
                            </tr>
                        </table>
                    </div>
                    <br>
                    <div id="detail-bottom">
                        <div style="font-weight: bold;">??????</div>
                        <br>
                        <div id="price-button">
                            <div class="frame-wrap">
                                <div class="btn-group btn-group-toggle viewMoreRadio" data-toggle="buttons">
                                    <label class="btn btn-outline-secondary">
                                        <input type="radio" name="options" class="deal" checked> ????????????
                                    </label>
                                    <label class="btn btn-outline-secondary">
                                        <input type="radio" name="options" class="sellBidding"> ????????????
                                    </label>
                                    <label class="btn btn-outline-secondary">
                                        <input type="radio" name="options" class="buyBidding"> ????????????
                                    </label>
                                </div>
                            </div>
                        </div>
                        <br>
                        
                        <!-- ???????????? ????????? -->
                        <div id="deal">
                            <table id="deal-size" class="price-detail" style="width: 100%; height: 150px">
                                <tr>
                                    <th style="padding-left:15px;">?????????</th>
                                    <th style="padding-left:15px;">?????????</th>
                                    <th style="padding-left:15px;">?????????</th>
                                </tr>
                                <% if(dList != null && dList.size() != 0) { %>
                                	<% if(dList.size() < 5) { %>
                                		<% for(int i=0; i<dList.size(); i++){ %>
                                			<tr style="height:26px">
		                                		<td><%= dList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(dList.get(i).getbPrice()) %>???</td>
			                                    <td align="right"><%= dList.get(i).getdDate() %></td>
		                                	</tr>
                                		<% } %>
                                		<% for(int i=dList.size(); i<5; i++) { %>
                                			<tr style="height:26px">
		                                		<td></td>
			                                    <td align="right"></td>
			                                    <td align="right"></td>
		                                	</tr>
                                		<% } %>
                                	<% } else { %>
	                                	<% for(int i=0; i<5; i++){ %>
		                                	<tr style="height:26px">
		                                		<td><%= dList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(dList.get(i).getbPrice()) %>???</td>
			                                    <td align="right"><%= dList.get(i).getdDate() %></td>
		                                	</tr>
		                                <% } %>
	                                <% } %>
                                <% } else{ %>
                                	<tr class="selectDealList">
                                		<td colspan="3" style="height: 130px; text-align:center;">
                                			????????? ????????? ?????? ????????????.
                                		</td>
                                	</tr>
                                <% } %>
                             </table>
                             <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th colspan="3">
                                        <button type="button" class="btn btn-secondary view-more" data-toggle="modal" data-target="#view-more">?????? ?????? ?????????</button>
                                    </th>
                                </tr>
                            </table>
                        </div>

                        <!-- ???????????? ????????? -->
                        <div id="sellBidding" hidden>
                            <table id="sellBidding-size" class="price-detail" style="width: 100%; height: 150px">
                                <tr>
                                    <th style="padding-left:15px;">?????????</th>
                                    <th style="padding-left:15px;">???????????????</th>
                                    <th style="padding-left:15px;">??????</th>
                                </tr>
                                <% if(sList != null && sList.size() != 0) { %>
                                	<% if(sList.size() < 5) { %>
                                		<% for(int i=0; i<sList.size(); i++) { %>
                                			<tr style="height:26px">
		                                		<td><%= sList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(sList.get(i).getbPrice()) %>???</td>
			                                    <td align="right"><%= sList.get(i).getCount() %></td>
	                                		</tr>
                                		<% } %>
                                		<% for(int i=sList.size(); i<5; i++) { %>
                                			<tr style="height:26px">
		                                		<td></td>
			                                    <td align="right"></td>
			                                    <td align="right"></td>
	                                		</tr>
                                		<% } %>
                                	<% } else {%>
	                                	<% for(int i=0; i<5; i++){ %>
		                                	<tr style="height:26px">
		                                		<td><%= sList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(sList.get(i).getbPrice()) %>???</td>
			                                    <td align="right"><%= sList.get(i).getCount() %></td>
		                                	</tr>
		                                <% } %>
	                                <% } %>
                                <% } else{ %>
                                	<tr>
                                		<td colspan="3" style="height: 130px; text-align:center;">
                                			?????? ???????????? ?????? ????????????.
                                		</td>
                                	</tr>
                                <% } %>
                            </table>
                            <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th colspan="3">
                                        <button type="button" class="btn btn-secondary view-more" data-toggle="modal" data-target="#view-more">?????? ?????? ?????????</button>
                                    </th>
                                </tr>
                            </table>
                        </div>

                        <!-- ???????????? ????????? -->
                        <div id="buyBidding" hidden>
                            <table id="buyBidding-size" class="price-detail" style="width: 100%; height: 150px">
                                <tr>
                                    <th style="padding-left:15px;">?????????</th>
                                    <th style="padding-left:15px;">???????????????</th>
                                    <th style="padding-left:15px;">??????</th>
                                </tr>
                                <% if(bList != null && bList.size() != 0) { %>
                                	<% if(bList.size() < 5){  %>
                                		<% for(int i=0; i<bList.size(); i++){ %>
		                                	<tr style="height:26px">
		                                		<td><%= bList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(bList.get(i).getbPrice()) %>???</td>
			                                    <td align="right"><%= bList.get(i).getCount() %></td>
		                                	</tr>
		                                <% } %>
		                                <% for(int i=bList.size(); i<5; i++){ %>
		                                	<tr style="height:26px">
		                                		<td></td>
			                                    <td align="right"></td>
			                                    <td align="right"></td>
		                                	</tr>
		                                <% } %>
                                	<% } else{ %>
	                                	<% for(int i=0; i<5; i++){ %>
		                                	<tr style="height:26px">
		                                		<td><%= bList.get(i).getpSize() %></td>
			                                    <td align="right"><%= formatter.format(bList.get(i).getbPrice()) %>???</td>
			                                    <td align="right"><%= bList.get(i).getCount() %></td>
		                                	</tr>
		                                <% } %>
	                                <% } %>
                                <% } else{ %>
                                	<tr>
                                		<td colspan="3" style="height: 130px; text-align:center;">
                                			?????? ???????????? ?????? ????????????.
                                		</td>
                                	</tr>
                                <% } %>
                            </table>
                            <table class="price-detail" style="width: 100%;">
                                <tr>
                                    <th colspan="3">
                                        <button type="button" class="btn btn-secondary view-more" data-toggle="modal" data-target="#view-more">?????? ?????? ?????????</button>
                                    </th>
                                </tr>
                            </table>
                        </div>
                        
                    </div>

                    <!-- ???????????? ????????? ?????? -->
                    <div class="modal" id="view-more">
                        <div class="modal-dialog">

                            <div class="modal-content">
                        
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h5 class="modal-title">??????</h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                
                                </div>
                                
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div class="product">
                                        <div class="product-info row">
                                            <div class="product-img col-sm-4">
                                                <img src="<%= contextPath %>/<%= p.getProductImgM() %>">
                                            </div>
                                            <div class="product-name col-sm-8">
                                                <div id="product-brand"><%= p.getBrandName() %></div>
                                                <div id="product-eng-name"><%= p.getProductNameEng() %></div>
                                                <div id="product-kor-name"><%= p.getProductNameKo() %></div>
                                                <span id="product-size">
                                                    <select id="modalPdSize" style="width: 120px;" onchange="ajaxSelectSizeResult();">
                                                        
                                                    </select>
                                                    <script>
						                            	$(function(){
						                            		var arr = "<%= p.getProductSize() %>".split(", ");
						                            		var sizeOption = "<option value='allSize'>?????? ?????????</option>";
						                            		for(let i=0; i<arr.length; i++){
						                            			sizeOption += "<option value='" + arr[i] + "'>" + arr[i] + "</option>"
						                            		}
						                            		$("#modalPdSize").html(sizeOption);
						               
						                            	})
						                            </script>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="" align="center">
                                            <div class="frame-wrap">
                                                <div class="btn-group btn-group-toggle viewMoreRadio" data-toggle="buttons">
                                                    <label class="btn btn-outline-secondary">
                                                        <input type="radio" name="options" class="modalDeal" checked> ????????????
                                                    </label>
                                                    <label class="btn btn-outline-secondary">
                                                        <input type="radio" name="options" class="modalSellBidding"> ????????????
                                                    </label>
                                                    <label class="btn btn-outline-secondary">
                                                        <input type="radio" name="options" class="modalBuyBidding"> ????????????
                                                    </label>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="modalList" style="overflow: auto;">
                                                <!--???????????? ?????????-->
                                                <div id="modalDeal">
                                                    <table id="modalDeal-size" class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">?????????</th>
                                                            <th style="padding-left:15px;">?????????</th>
                                                            <th style="padding-left:15px;">?????????</th>
                                                        </tr>
                                                        <% if(dList != null && dList.size() != 0) { %>
						                                	<% for(int i=0; i<dList.size(); i++){ %>
							                                	<tr>
							                                		<td><%= dList.get(i).getpSize() %></td>
								                                    <td align="right"><%= formatter.format(dList.get(i).getbPrice()) %>???</td>
								                                    <td align="right"><%= dList.get(i).getdDate() %></td>
							                                	</tr>
							                                	
							                                <% } %>
						                                <% } else{ %>
						                                	<tr class="selectDealList">
						                                		<td colspan="3" style="height: 130px; text-align:center;">
						                                			????????? ????????? ?????? ????????????.
						                                		</td>
						                                	</tr>
						                                <% } %>
                                                    </table>
                                                </div>
                        
                                                <!-- ???????????? ????????? -->
                                                <div id="modalSellBidding" hidden>
                                                    <table id="modalSellBidding-size" class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">?????????</th>
                                                            <th style="padding-left:15px;">???????????????</th>
                                                            <th style="padding-left:15px;">??????</th>
                                                        </tr>
                                                        <% if(sList != null && sList.size() != 0) { %>
						                                	<% for(int i=0; i<sList.size(); i++){ %>
							                                	<tr>
							                                		<td><%= sList.get(i).getpSize() %></td>
								                                    <td align="right"><%= formatter.format(sList.get(i).getbPrice()) %>???</td>
								                                    <td align="right"><%= sList.get(i).getCount() %></td>
							                                	</tr>
							                                <% } %>
						                                <% } else{ %>
						                                	<tr>
						                                		<td colspan="3" style="height: 130px; text-align:center;">
						                                			?????? ???????????? ?????? ????????????.
						                                		</td>
						                                	</tr>
						                                <% } %>
                                                    </table>
                                                </div>
                        
                                                <!-- ???????????? ????????? -->
                                                <div id="modalBuyBidding" hidden>
                                                    <table id="modalBuyBidding-size" class="price-detail" style="width: 100%;">
                                                        <tr>
                                                            <th style="padding-left:15px;">?????????</th>
                                                            <th style="padding-left:15px;">???????????????</th>
                                                            <th style="padding-left:15px;">??????</th>
                                                        </tr>
                                                        <% if(bList != null && bList.size() != 0) { %>
						                                	<% for(int i=0; i<bList.size(); i++){ %>
							                                	<tr>
							                                		<td><%= bList.get(i).getpSize() %></td>
								                                    <td align="right"><%= formatter.format(bList.get(i).getbPrice()) %>???</td>
								                                    <td align="right"><%= bList.get(i).getCount() %></td>
							                                	</tr>
							                                <% } %>
						                                <% } else{ %>
						                                	<tr>
						                                		<td colspan="3" style="height: 130px; text-align:center;">
						                                			?????? ???????????? ?????? ????????????.
						                                		</td>
						                                	</tr>
						                                <% } %>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>


                    <script>
	                    function toMoney(num) {
	                        return num.toLocaleString('ko-KR');
	                    }	
	                    
                        $(function(){
                            $(".deal").click(function(){
                                $("#deal").attr("hidden", false);
                                $("#buyBidding").attr("hidden", true);
                                $("#sellBidding").attr("hidden", true);
                            })
                            $(".buyBidding").click(function(){
                                $("#deal").attr("hidden", true);
                                $("#buyBidding").attr("hidden", false);
                                $("#sellBidding").attr("hidden", true);
                            })
                            $(".sellBidding").click(function(){
                                $("#deal").attr("hidden", true);
                                $("#buyBidding").attr("hidden", true);
                                $("#sellBidding").attr("hidden", false);
                            })
                            $(".modalDeal").click(function(){
                                $("#modalDeal").attr("hidden", false);
                                $("#modalBuyBidding").attr("hidden", true);
                                $("#modalSellBidding").attr("hidden", true);
                            })
                            $(".modalBuyBidding").click(function(){
                                $("#modalDeal").attr("hidden", true);
                                $("#modalBuyBidding").attr("hidden", false);
                                $("#modalSellBidding").attr("hidden", true);
                            })
                            $(".modalSellBidding").click(function(){
                                $("#modalDeal").attr("hidden", true);
                                $("#modalBuyBidding").attr("hidden", true);
                                $("#modalSellBidding").attr("hidden", false);
                            })
                        })
                        
                        var dCount = <%= dList.size() %>;
                        var sCount = <%= sList.size() %>;
                        var bCount = <%= bList.size() %>;

                        function ajaxSelectSizeResult(){

                            var pSize = $(window.event.target).val();
                            $.ajax({
                        		url:"<%= contextPath %>/bSizeList.bi",
            					data:{
            						co: <%= p.getProductCode() %>,
            						size: pSize
            					},
            					success:function(list){            					
            						if(list.length != 0){
            							var dSizeList = list[0];
                                        var sSizeList = list[1];
                                        var bSizeList = list[2];
                                        if(dCount != 0 && sCount != 0 && bCount != 0){
                                            // ?????????
                                        	for(let i=1; i<=5; i++){
	                                            $("#deal-size tbody").children().eq(i).html("");
	                                            $("#sellBidding-size tbody").children().eq(i).html("");
	                                            $("#buyBidding-size tbody").children().eq(i).html("");
                                        	}
                                            // ??????
                                            for(let i=1; i<= dCount; i++){
                                                $("#modalDeal-size tbody").children().eq(i).html("");
                                            }
                                            for(let i=1; i<= sCount; i++){
                                                $("#modalSellBidding-size tbody").children().eq(i).html("");
                                            }
                                            for(let i=1; i<= bCount; i++){
                                                $("#modalBuyBidding-size tbody").children().eq(i).html("");
                                            }
                                        }
                                        
            							if(dSizeList.length != 0){
            								// ?????????
            								if(dSizeList.length < 5){
            									for(let i=0; i<dSizeList.length; i++){
            										$("#deal-size tbody").children().eq(i+1).html("<td>" + dSizeList[i].pSize + "</td>"
																								+ "<td align='right'>" + toMoney(dSizeList[i].bPrice) + "???</td>"
																								+ "<td align='right'>" + dSizeList[i].dDate + "</td>");
            										
            									}
            								} else{
            									for(let i=0; i<5; i++){
            										$("#deal-size tbody").children().eq(i+1).html("<td>" + dSizeList[i].pSize + "</td>"
																								+ "<td align='right'>" + toMoney(dSizeList[i].bPrice) + "???</td>"
																								+ "<td align='right'>" + dSizeList[i].dDate + "</td>");
            									}
            								}
                                            // ??????
            								for(let i=0; i<dSizeList.length; i++){
        										$("#modalDeal-size tbody").children().eq(i+1).html("<td>" + dSizeList[i].pSize + "</td>"
																							+ "<td align='right'>" + toMoney(dSizeList[i].bPrice) + "???</td>"
																							+ "<td align='right'>" + dSizeList[i].dDate + "</td>");
        									}
            								
            							} else{
                                            // ?????????
                                            $("#deal-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>????????? ????????? ?????? ????????????.</td>");
                                            // ??????
                                            $("#modalDeal-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>????????? ????????? ?????? ????????????.</td>");

                                        }

                                        if(sSizeList.length != 0){
            								// ?????????
            								if(sSizeList.length < 5){
            									for(let i=0; i<sSizeList.length; i++){
            										$("#sellBidding-size tbody").children().eq(i+1).html("<td>" + sSizeList[i].pSize + "</td>"
                                                                                                        + "<td align='right'>" + toMoney(sSizeList[i].bPrice) + "???</td>"
                                                                                                        + "<td align='right'>" + sSizeList[i].count + "</td>");
            										
            									}
            								} else{
            									for(let i=0; i<5; i++){
            										$("#sellBidding-size tbody").children().eq(i+1).html("<td>" + sSizeList[i].pSize + "</td>"
                                                                                                        + "<td align='right'>" + toMoney(sSizeList[i].bPrice) + "???</td>"
                                                                                                        + "<td align='right'>" + sSizeList[i].count + "</td>");
            									}
            								}
                                            // ??????
                                            for(let i=0; i<sSizeList.length; i++){
        										$("#modalSellBidding-size tbody").children().eq(i+1).html("<td>" + sSizeList[i].pSize + "</td>"
                                                                                                    + "<td align='right'>" + toMoney(sSizeList[i].bPrice) + "???</td>"
                                                                                                    + "<td align='right'>" + sSizeList[i].count + "</td>");
        									}
            								
            							} else{
                                            // ?????????
                                            $("#sellBidding-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>?????? ???????????? ?????? ????????????.</td>");
                                            // ??????
                                            $("#modalSellBidding-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>?????? ???????????? ?????? ????????????.</td>");

                                        }

                                        if(bSizeList.length != 0){
            								// ?????????
            								if(bSizeList.length < 5){
            									for(let i=0; i<bSizeList.length; i++){
            										$("#buyBidding-size tbody").children().eq(i+1).html("<td>" + bSizeList[i].pSize + "</td>"
                                                                                                        + "<td align='right'>" + toMoney(bSizeList[i].bPrice) + "???</td>"
                                                                                                        + "<td align='right'>" + bSizeList[i].count + "</td>");
            										
            									}
            								} else{
            									for(let i=0; i<5; i++){
            										$("#buyBidding-size tbody").children().eq(i+1).html("<td>" + bSizeList[i].pSize + "</td>"
                                                                                                        + "<td align='right'>" + toMoney(bSizeList[i].bPrice) + "???</td>"
                                                                                                        + "<td align='right'>" + bSizeList[i].count + "</td>");
            									}
            								}
                                            // ??????
                                            for(let i=0; i<bSizeList.length; i++){
        										$("#modalBuyBidding-size tbody").children().eq(i+1).html("<td>" + bSizeList[i].pSize + "</td>"
                                                                                                    + "<td align='right'>" + toMoney(bSizeList[i].bPrice) + "???</td>"
                                                                                                    + "<td align='right'>" + bSizeList[i].count + "</td>");
        										
        									}
            								
            							} else{
                                            // ?????????
                                            $("#buyBidding-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>?????? ???????????? ?????? ????????????.</td>");
                                            // ??????
                                            $("#modalBuyBidding-size tbody").children().eq(3).html("<td colspan='3' style='text-align:center;'>?????? ???????????? ?????? ????????????.</td>");

                                        }



            						} else{
                                        console.log("???????????? ????????? ajax ???????????? ??????")
                                    }
            						
            					},
            					error:function(){
            						console.log("???????????? ????????? ajax ?????? ??????");	
            					}
                        	})

                            $("#modalPdSize").val(pSize);
                            $("#pSize").val(pSize);
                        }

                        /*
                        function selectSize(){
                        	var pSize = $("#pSize").val();
                        	$("#modalPdSize").val(pSize);
                        	ajaxSelectSizeResult(); 
                        	
                            
                        }

                        function modalSelectSize(){
                            var pSize = $("#modalPdSize").val();
                        	$("#pSize").val(pSize);
                            ajaxSelectSizeResult(); 
                        }
                        */

                    </script>
                    
                </div>
            </div>
            
        </div>
        
        <div class="product-footer">
            
            <div class="style-feed">
                <table id="style-preview">
                    <thead>
                        <tr>
                            <th colspan="4" style="font-size: 20px;">?????????</th>
                        </tr>
                        <% if(st.size() != 0 && iList.size() != 0) { %>
                        	<tr>
                        	<% for(int i=0; i<iList.size(); i++) { %>
                        		<td><img src="<%= contextPath %>/<%= iList.get(i).getFilePath() %>" alt=""></td>
                        	<% } %>
                        	<% for(int i=iList.size(); i<4; i++) { %>
                        		<td></td>
                        	<% } %>
                        	</tr>
                    	</thead>
                    	<tbody>
                        	
                        	<% if(st.size() < 4) {  %>
	                        	<tr>
	                        	<% for(int i=0; i<st.size(); i++) { %>
	                        		<td><%= st.get(i).getUserId()  %></td>
	                        	<% } %>
	                        	<% for(int i=st.size(); i<4; i++) { %>
	                        		<td></td>
	                        	<% } %>
	                        	</tr>
	                        	<tr>
	                        	<% for(int i=0; i<st.size(); i++) { %>
	                        		<td><%= st.get(i).getHashtag() %></td>
	                        	<% } %>
	                        	<% for(int i=st.size(); i<4; i++) { %>
	                        		<td></td>
	                        	<% } %>
                        	    </tr>
                        	<% } else { %>
                        		<tr>
                       			<% for(int i=0; i<4; i++) { %>
                       				<td><%= st.get(i).getUserId() %></td>
                       			<% } %>
                        		</tr>
                        		<tr>
                        		<% for(int i=0; i<4; i++) { %>
                        			<td><%= st.get(i).getHashtag() %></td>
                        		<% } %>
                        		</tr>
                        	<% } %>
                        <% } else {%>
                        	<tr class="noStyle" rowspan = "3">
                        		<td colspan="4" align="center">????????? ????????? ???????????? ????????????.</td>
                        	</tr>
                        <% } %>
                   </tbody>
                       
                </table>
                <br><br><br>
                <div style="text-align: center;"><button type="button" class="btn btn-secondary btn-sm moreStyle">?????????</button></div>
            </div>
        </div>
		<br><br>
    </div>
    <script>
    	$(".moreStyle").click(function(){
    		location.href = "<%= contextPath %>/stylelist.st?view=trending";
    	})
    </script>
</body>
</html>