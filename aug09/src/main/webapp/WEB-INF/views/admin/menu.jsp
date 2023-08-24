<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="menu">
		<div class="menu-logo" onclick="url('main')"><img alt="menu-logo" src="../img/menu_logo.png"></div>
		<div class="menu-item" onclick="url('multiBoard')"><i class="xi-document xi-2x"></i>게시판 관리</div>
		<div class="menu-item" onclick="url('post')"><i class="xi-pen-o xi-2x"></i>게시글 관리</div>
		<div class="menu-item" onclick="url('member')"><i class="xi-users-o xi-2x"></i>회원 관리</div>
		<div class="menu-item" onclick="url('comment')"><i class="xi-comment-o xi-2x"></i>댓글 관리</div>
		<div class="menu-item" onclick="url('message')"><i class="xi-message-o xi-2x"></i>메시지 관리</div>
		<div class="menu-item" onclick="url('mail')"><i class="xi-mail-o xi-2x"></i>메일 보내기</div>
		<div class="menu-item" onclick="url('notice')"><i class="xi-info-o xi-2x"></i>공지사항</div>
		<div class="menu-item" onclick="url('logout')"><i class="xi-profile-o xi-2x"></i>로그아웃</div>
		</div>
		<script>function url(url){location.href="./"+url;}</script>
