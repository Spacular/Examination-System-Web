<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="Database_Project.Register.Registeration" %>

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
    <script type="text/javascript">
        function goback() {
            //location.href("http://www.naver.com");
            location.replace("http://www.naver.com");
        }
    </script>
<body style="position:absolute; left:40%; top:20%; padding-right:2em; padding-bottom:1em; padding-left:2em; box-shadow: 8px 8px 5px rgba(0,0,0,.5);">
    <form id="form1" runat="server">
        <table>
            <tr>
                <td colspan="2" style="border-top: 3px solid grey; border-top-style:hidden; height:5px;">
                    <h2> 회원가입</h2>
                </td>
                <td style="text-align:right;">
                    <asp:Button ID="Button2" CssClass="w-button" runat="server" Text="돌아가기" OnClick="goback"  />
                </td>
            </tr>
            <tr>
                <td colspan="3" style="border-top: 3px solid grey; border-top-style:hidden; height:5px;">
                    <h4> 다음의 항목들을 작성해 주십시오.</h4>
                </td>
            </tr>
            <tr>
                <th><label for="SID">학번:</label></th>
                <td width= 20></td>
                <td><input type="number" style="text-align:right; width:215px; height:20px; font-size:10pt;" name="SID" id="SID" tabindex="1" autofocus /"></td>
            </tr>
            <tr>
                <td colspan="3" style="border-top: 3px solid grey; border-top-style:hidden; height:5px;"></td>
            </tr>
            <tr>
                <th><label for="Passwd">비밀번호:</label></th>
                <td width= 20></td>
                <td><input type="password" style="text-align:right; width:215px; height:20px; font-size:10pt;" name="Passwd" id="Passwd" tabindex="2"  /"></td>
            </tr>
            <tr>
                <td colspan="3" style="border-top: 3px solid grey; border-top-style:hidden; height:5px;"></td>
            </tr>
            <tr>
                <th><label for="sname">이름:</label></th>
                <td width= 20></td>
                <td><input type="text" style="text-align:right; width:215px; height:20px; font-size:10pt;" name="sname" id="sname" tabindex="3"  /"></td>
            </tr>
            <tr>
                <td colspan="3" style="border-top: 3px solid grey; border-top-style:hidden; height:5px;"></td>
            </tr>
            <tr>
                <th><label for="dname">학과:</label></th>
                <td width= 20></td>
                <td><input type="text" style="text-align:right; width:215px; height:20px; font-size:10pt;" name="dname" id="dname" tabindex="4"  /"></td>
            </tr>
            <tr>
                <td colspan="3" style="border-top: 3px solid grey; border-top-style:hidden; height:5px;"></td>
            </tr>
            <tr>
                <th class="auto-style1"><label for="sex">성별:</label></th>
                <td width= 20 class="auto-style1"></td>
                <td class="auto-style1" style="text-align:left;">
                        <input type="radio" value="M" style=" height:20px; font-size:10pt;" name="sex" id="male" tabindex="5"   /"><label style="width:10px;">남자</label>
                        <input type="radio" value="F" style="height:20px; font-size:10pt;" name="sex" id="female" tabindex="6"   /"><label style="width:10px;">여자</label>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="border-top: 3px solid grey; border-top-style:hidden; height:5px;"></td>
            </tr>
            <tr>
                <th><label for="sex">전화번호:</label></th>
                <td width= 20></td>
                <td><input type="tel" style="text-align:right; width:215px; height:20px; font-size:10pt;"name="phone" id="phone" tabindex="7"  /"></td>
            </tr>
            <tr>
                <td colspan="3">
                    <h6>주의: -는 제외하고 적어주시기 바랍니다.</h6>
                </td>
            </tr>
            <tr>
                <th></th>
                <td width= 20></td>
                <td style="text-align:right;">
                    <input type="reset" value="다시작성" class="w-button" id="rewrite" name="rewrite"/>
                    <asp:Button ID="Button1" CssClass="w-button" runat="server" Text="등록하기" OnClick="Registration"  />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
