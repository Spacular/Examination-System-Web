<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Database_Project.WebForm1" %>
<!DOCTYPE html>
<style>
    body{
        //background-image: url('/배경.png');
        background-repeat: no-repeat;
        background-image: url('/background.png');
        height: 511px;
    } 
    #form1 {
        height: 667px;
    }
    .auto-style1 {
        height: 30px;
    }
    .w-button {
        display: inline-block;
        padding: 6px 12px;
        background-color: #3898ec;
        color: white;
        border: 0;
        line-height: inherit;
        text-decoration: none;
        cursor: pointer;
        border-radius: 0;
    }
    .auto-style2 {
        height: 41px;
    }
    .login{
        position: absolute;
        left: 41%;
        bottom: 48%;
        border: 1px solid #A6A6A6
    }
    .auto-style3 {
        height: 39px;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> 과제 검사 시스템 로그인 로그인 페이지 </title>
</head>
<body>
    <form id="form1" runat="server">
		<table class="login">
			<tr>
                <td width="10"></td>
				<th style="color:black; font-family:'Malgun Gothic'; font-weight:900; text-align:right;" class="auto-style1"><label for="username"> 아이디:</label></th>
				<td width = "20" class="auto-style1"></td>
				<td style="text-align:right;" class="auto-style1"><input style="text-align:right; width:215px; height:20px; font-size:10pt;" type="text" name="loginID" id="username" tabindex="1" autofocus /></td>
                <td width="10"></td>
			</tr>				           
            <tr>
                <td width="10" class="auto-style3"></td>
				<th style="color:black; text-align:right;" class="auto-style3"><label for="password">비밀번호:</label></th>
				<td width = "20" class="auto-style3"></td>
				<td style="text-align:right;" class="auto-style3"><input style="text-align:right; width:215px; height:20px; font-size:10pt;" type="password" name="password" id="password" tabindex="2" /></td>
                <td width="10" class="auto-style3"></td>
			</tr>
			<tr
				<td></td>
				<td style="text-align:left;"></td>
			</tr>
			<tr>
                <td width="10" class="auto-style2"></td>
				<td class="auto-style2"></td>
				<td class="auto-style2"></td>
				<td style="text-align:right;" class="auto-style2">
				    <!--<asp: input type="submit" name = "login" value="로그인" data-wait="Please wait..." class="w-button">-->
                    <asp:Button ID="RegisterButton" runat="server" Text="학생등록" class="w-button" OnClick="Register" />
                    <asp:Button ID="LoginButton" runat="server" text="로그인" class="w-button" OnClick="Login" style=" text-align:center;"/>
				</td>
                <td width="10" class="auto-style2"></td>
			</tr>
		</table>
    </form>
    <address style="color: white; position: absolute; bottom: 1%; left: 33%;"> Yeoungnam University, Engineering College, Computer Engineering Department, 2015 </address>
</body>
</html>
