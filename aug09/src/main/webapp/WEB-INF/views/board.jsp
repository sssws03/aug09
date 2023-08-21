<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ❤ board</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="./js/jquery-3.7.0.min.js"></script>
	<style type="text/css">
		.title{
			text-align: left;
		}
		.detail-detail{
			width: 100%;
			height: auto;
		}
		.detail-name, .detail-date-read{
			width: 100%;
			height: 30px;
			border-bottom: 1px solid #c0c0c0;
		}
		.detail-date-read{
			background-color: silver;
		}
		.detail-date{
			padding-left:10px;
			float: left;
		}
		.detail-read{
			padding-right:10px;
			float: right;
		}
		.detail-content{
			width: 100%;
			min-height: 500px;
			height:calc(100vh - 230px);
			height: auto;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		$(document).on("click", ".del", function(){
			//가상 form만들어서 전송하기
			let form = $('<form></form>');
			form.attr('action', './delete');
			form.attr("method", "post");
			
			form.append($("<input>", {type:'hidden', name:"bno", value:$(".bno").val()}));
			form.append($("<input>", {type:'hidden', name:"uuid", value:$(".uuid").val()}));
			
			form.appendTo("body");
			form.submit();
		});
		
		$(document).on("click", ".edit", function(){
			let bno = $(".bno").val();
			let uuid = $(".uuid").val();
			alert(bno + " / " + uuid);
		});
		
		
		$(".detail").click(function(){
			let bno = $(this).children("td").eq(0).html();
			let title = $(this).children("td").eq(1).text();
			let name = $(this).children("td").eq(2).html();
			let date = $(this).children("td").eq(3).html();
			let read = Number($(this).children("td").eq(4).html()) + 1;
			let comment =  $(this).children("td").eq(1).children(".bg-secondary").text().length+1;
			if(comment > 0){title = title.slice(0, -comment);}
			//alert(first.text());
			//$(".modal-bno").text(bno + "/" + name + "/" + read);

			$.ajax({
				url:"./detail",
				type: "post",
				data: {bno: bno},
				dataType: "json",
				success:function(data){
					//alert(data.content);
					$(".modal-title").text(title);
					name = name + '<img class="" src="./img/edit.png"> <img class="del" src="./img/delete.png">';
					name += '<input type="hidden" class="bno" value="'+bno+'">';
					name += '<input type="hidden" class="uuid" value="'+data.uuid+'">';
					$(".detail-name").html(name);
					$(".detail-date").text(date);
					$(".detail-read").text(data.ip+" / "+read);
					$(".detail-content").html(data.content);
					$("#exampleModal").modal("show");
				},
				error:function(error){alert("에러가 발생했습니다. 다시 시도하지 마십시오.");}
			});
		});
		//$(".modalOpen").click(function(){$("#exampleModal").modal("show");});
	});
	</script>
</head>
<body>
<%@ include file="menu.jsp" %>
 <!-- Masthead-->
        <header class="masthead">
            <div class="container">
               <h1>게시판</h1>
               <table class="table table-dark table-hover table-striped">
               		<thead>
               		<tr class="row">
               			<th class="col-1">번호</th>
               			<th class="col-6">제목</th>
               			<th class="col-2">글쓴이</th>
               			<th class="col-2">날짜</th>
               			<th class="col-1">읽음</th>
               		</tr>
               		</thead>
               		<tbody><c:forEach items="${list }" var="row">
               		<tr class="row detail">
               			<td class="col-1">${row.bno}</td>
               			<td class="col-6 title">${row.btitle}<c:if test="${row.commentcount ne 0 }">&nbsp;<span class="badge bg-secondary">${row.commentcount}</span></c:if></td>
               			<td class="col-2">${row.m_name}</td>
               			<td class="col-2">${row.bdate}</td>
               			<td class="col-1">${row.blike}</td>
               		</tr></c:forEach>
               		</tbody>
               </table>
               <button type="button" class="btn btn-secondary" onclick="location.href='./write'">글쓰기</button>
            </div>
        </header>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="detail-deail">
      		 <div class="detail-name">이름</div>
      		 <div class="detail-date-read">
      		 	<div class="detail-date">날짜</div>
      		 	<div class="detail-read">읽음</div>
      		 </div>
      		 <div class="detail-content">본문내용</div>
      	</div>  
      </div>
    </div>
  </div>
</div>





       <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>