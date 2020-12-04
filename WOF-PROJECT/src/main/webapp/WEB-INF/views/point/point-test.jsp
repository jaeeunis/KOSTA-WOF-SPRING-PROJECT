<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 
<body>
<div>
    <table id="addList" border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>제  목</th>
                <th>내    용</th>
            </tr>
        </thead>
        <tbody id="listBody">
        </tbody>
    </table>  
</div>  
        <button id="addBtn" onclick="moreList();"><span>더보기</span></button>
</body>
</html>
 
<script>
moreList(); //함수 호출
 
function moreList() {
 
    var startNum = $("#listBody tr").length;  //마지막 리스트 번호를 알아내기 위해서 tr태그의 length를 구함.
    var addListHtml = "";  
    console.log("startNum", startNum); //콘솔로그로 startNum에 값이 들어오는지 확인
 
     $.ajax({
        url : "/study/getfilmList",
        type : "post",
        dataType : "json",
        data : {"startNum":startNum},
        
        success : function(data) {
            if(data.length < 10){
                $("#addBtn").remove();   // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
            }else{
            var addListHtml ="";
            if(data.length > 0){
                
                for(var i=0; i<data.length;i++) {
                    var idx = Number(startNum)+Number(i)+1;   
                    // 글번호 : startNum 이  10단위로 증가되기 때문에 startNum +i (+1은 i는 0부터 시작하므로 )
                    addListHtml += "<tr>";
                    addListHtml += "<td>"+ idx + "</td>";
                    addListHtml += "<td>"+ data[i].title + "</td>";
                    addListHtml += "<td>"+ data[i].description + "</td>";
                    addListHtml += "</tr>";
                }
                $("#listBody").append(addListHtml);
            }
            }
        }
    });
 
}
</script>