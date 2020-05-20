<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

    <div>
<table onload="tableCreate()" style="border: 1px;" id="dynamicTable">
<thead>
<tr>
<th>이름</th>
<th>직업</th>
<th>나이</th>
<th>취미</th>
</tr>
</thead>
<tbody id="dynamicTbody">
    
</tbody>
</table>
<button onclick="tableCreate()">table_append</button>
</div>

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
</script>