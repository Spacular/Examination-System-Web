<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Database_Project.WebForm1" %>
<!DOCTYPE html>
<style>
    body{
        background-image: url('/배경.png');
        background-repeat: no-repeat;
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
        padding: 9px 15px;
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
        left: 35%;
        bottom: 55%;
        border: 1px solid #A6A6A6
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
				<th style="color:black; text-align:right;" class="auto-style1"><label for="username"> 아이디:</label></th>
				<td width = "30" class="auto-style1"></td>
				<td style="text-align:right;" class="auto-style1"><input style="text-align:right; width:200px; height:20px; font-size:10pt;" type="text" name="loginID" id="username" tabindex="1" autofocus required/></td>
                <td width="10"></td>
			</tr>				           
            <tr>
                <td width="10"></td>
				<th style="color:black; text-align:right;"><label for="password">비밀번호:</label></th>
				<td width = "30"></td>
				<td style="text-align:right;"><input style="text-align:right; width:200px; height:20px; font-size:10pt;" type="password" name="password" id="password" tabindex="2" required /></td>
                <td width="10"></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align:left;"></td>
			</tr>
			<tr>
                <td width="10"></td>
				<td class="auto-style2"></td>
				<td class="auto-style2"></td>
				<td style="text-align:right;" class="auto-style2">
				    <!--<asp: input type="submit" name = "login" value="로그인" data-wait="Please wait..." class="w-button">-->
                    <asp:Button ID="LoginButton" runat="server" text="로그인" class="w-button" OnClick="Login" />
				</td>
                <td width="10"></td>
			</tr>
		</table>
    </form>
</body>
</html>
