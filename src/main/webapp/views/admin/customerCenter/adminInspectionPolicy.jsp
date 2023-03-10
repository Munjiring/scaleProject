<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검수정책</title>
<style>
    .outer{
        width:1200px;
        margin:auto;
        margin-top:50px;
    }
    .outer-2{width:80%;}
    .title{
        text-align:center;
        margin-bottom:30px;
    }
    #notiTitle{
        font-weight:800;
        font-size:18px;
    }
    .inquire-form{
        text-align:center;
        font-size:14px;
    }
	.inquire-form textarea{
	    width:60%
	}
	.inquire-form input[type=text]{
	    width:60%
	}
	.inquire-form td{
	    text-align:left
	}
	.btn{
	    margin:5px;
	}
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	
	<div class="outer" align="center">
        <div class="outer-2">
            <div class="title">
                <h2><b>검수정책 관리</b></h2>
                <br>
            </div>
            <br><br>
        </div>
        <div class="form-area">
            <form class="enroll-form" action="inspection.ad" method="post">
                <table class="table enroll-form">
                    <tr>
                        <th height="200"><span class="rq-mark">*</span>검수 정책 내용</th>
                        <td>
                            <textarea name="noticeDoc" id="summernote"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>최종 수정일</th>
                        <td>
                            <input type="radio" name="display" value="Y"> ㅎㅎ
                        </td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-dark">등록</button>
            </form>
            <br><br>
        	</div>
        </div>
    </div>

<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script>
    $(function() {
        $('#summernote').summernote({
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
        });
    });

    $(function() {
	    $('#summernote').summernote();
	});
</script>

</body>
</html>