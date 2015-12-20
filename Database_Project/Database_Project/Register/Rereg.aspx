<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rereg.aspx.cs" Inherits="Database_Project.Register.Rereg" %>

<!DOCTYPE html>
<style>
        th{
            font-family:'Malgun Gothic';
            font-weight:800;
            font-size: 20px;
            text-align: right;
        }
        .auto-style1 {
            height: 31px;
        }
        td{
            height:30px;
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
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="position:absolute; left:40%; top:20%; padding-right:2em; padding-bottom:1em; padding-left:2em; ">
    <form id="form1" runat="server">
        <h1>등록할 비밀번호를 입력하십시오.</h1>
        <table>
           <tr>
               <th><label for="passwd">비밀번호:</label></th>
               <td width= 20></td>
               <td><input type="password" style="text-align:right; width:215px; height:20px; font-size:10pt;"name="passwd" id="passwd" tabindex="1" required/"></td>
           </tr>
           <tr>
               <th></th>
               <td width= 20></td>
               <td style="text-align:right;">
                   <asp:Button ID="Button1" CssClass="w-button" runat="server" Text="등록하기" OnClick="Change"  />
               </td>
           </tr>
        </table>
    </form>
</body>
</html>
