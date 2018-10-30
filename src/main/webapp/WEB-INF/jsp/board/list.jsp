<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <style>
     
        #divtable{
            width: 60%;
            position:absolute;
            margin-left: 20%;
            margin-top:15%;
            

            
        }
        table > thead> tr> th ,table > tbody> tr > td {
            text-align: center;
           
        }
        #recom{
            color: blue;
            font-weight: bold;
        }
        #opposite{
            color:red;
            font-weight: bold;
        }
     
       #button{
           color:black;
       }
       #selectorMenu{
           margin-top:13%;
           position:absolute;
        
         
           width:60%;
           margin-left: 20%;
          height:30px;
        
       }
   
       #selectList {
           width:30px;
          
          
       }
       #selectForm{
          
           width: 440px;
         
           float: right;
       }
       #reportList{
           width:120px;
           visibility: hidden;
           position: relative;
           float: left;
       }
    </style>
</head>
<body>

     <div id="selectorMenu" >  
         
            
            
        <span id="selectList"  >
            <form id="reportList"><button><img src="C:/git/codin-mini2/src/main/webapp/WEB-INF/img/KakaoTalk_20181028_224537696.gif" style="height:25px;"></button></form>                      
            <form id="selectForm" method="GET" >
                <select id="item" style="height:30px;">
                        <option>제목</option>
                        <option>닉네임</option>
                        <option>내용</option>
                        <option>내가 쓴 글 검색</option>
                </select>
                <input type="text" name="search" style="height:30px;">
                <select id="selectDate" style="height:30px;">
                        <option>기간선택</option>
                        <option>최근 1개월</option>
                        <option>최근 3개월</option>   
                        <option>최근 6개월</option>
                        <option>최근 1년</option>
                        <option>전체검색</option>
                    </select>
                <button id="button" style="float:right;"><img src="C:/git/codin-mini2/src/main/webapp/WEB-INF/img/KakaoTalk_20181028_222543606.gif" style="height: 25px;"></button>
            </form>
        </span>  
    </div>


    <div id="divtable">
      
        <table class="table table-striped">
            <thead>
                <tr>
                    <th></select>
                        <select id="category">
                            <option>전체</option>
                            <option>자유</option>
                            <option>고민</option>
                            <option>하소연</option>
                            <option>감성</option>  
                            <option>질문</option>            
                        </select></th>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>닉네임</th>
                    <th><a href="#">조회수순</th>
                    <th><a href="# ">추천순</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>자유</td>
                    <td>1</td>
                    <td><a href="#">코딩을 잘하고 싶어요</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>자유</td>
                    <td>2</td>
                    <td><a href="#">코딩을 잘하고 싶어요</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>3</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>4</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>5</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>6</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>

                <tr>
                    <td>질문</td>
                    <td>7</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>8</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>9</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>10</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>11</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td></td>
                    <td>12</td>
                    <td><a href="#">날씨가 참 좋군</a></td>
                    <td>방랑자</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>13</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>14</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>
                <tr>
                    <td>질문</td>
                    <td>15</td>
                    <td><a href="#">이 코드 해석좀</a></td>
                    <td>코딩 새내기</td>
                    <td>2</td>
                    <td><span id="recom">1</span>/<span id="opposite">2</span></td>
                    <td>2018/10/25</td>
                </tr>

            </tbody>
        </table>
  

    <hr>

    <a class="btn btn-default pull-right"><img src="/codin_mini/src/main/webapp/img/KakaoTalk20181028221348368.gif" style="height:25px;"/></a><br>
    <div class="text-center">
        <ul class="pagination">
            <li><a href="#"><<</a></li>
            <li><a href="#"><</a></li> 
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">6</a></li>
            <li><a href="#">7</a></li>
            <li><a href="#">8</a></li>
            <li><a href="#">9</a></li>
            <li><a href="#">10</a></li>
            <li><a href="#">></a></li>
            <li><a href="#">>></a></li>
        </ul>
    </div>
      </div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>