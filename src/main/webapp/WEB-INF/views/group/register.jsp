<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<style>
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>

<table class="type09">
    <thead>
    <tr>
        <th scope="cols">타이틀</th>
        <th scope="cols">내용</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">항목명</th>
        <td>내용이 들어갑니다.</td>
    </tr>
    <tr>
        <th scope="row">항목명</th>
        <td>내용이 들어갑니다.</td>
    </tr>
    <tr>
        <th scope="row">항목명</th>
        <td>내용이 들어갑니다.</td>
    </tr>
    </tbody>
</table>

    <script>
    function tableCreate(){

    	var tc = new Array();
    	var html = '';
    			
    	tc.push({name : '남궁민수', job : '기관사', age : 50,hobby : '노래듣기' }); 
    	tc.push({name : '유재석', job : 'MC', age : 40,hobby : '운동' }); 
    	tc.push({name : '박명수', job : '개그맨', age : 42,hobby : '영어' }); 
    	tc.push({name : '정준하', job : '엔터테이너', age : 41,hobby : '맛집탐방' }); 
    	tc.push({name : '정형돈', job : '개그맨', age : 36,hobby : '잠자기' }); 

    	for(key in tc){
    	html += '<tr>';
    	html += '<td>'+tc[key].name+'</td>';
    	html += '<td>'+tc[key].job+'</td>';
    	html += '<td>'+tc[key].age+'</td>';
    	html += '<td>'+tc[key].hobby+'</td>';
    	html += '</tr>';
    	}
    				
    	$("#dynamicTbody").empty();
    	$("#dynamicTbody").append(html);
    				
    	}
    $(document).ready(function() { tableCreate(); });
</script>