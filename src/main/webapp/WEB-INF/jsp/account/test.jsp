<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
var num_rows=0;
var new_row_num=0;
function add_new_row(obj,n) {
    $("#num_rows").val(++num_rows);
    var tag = ""
    tag +="<tr bgcolor=\"#ffffff\" id=\"tr_id"+(new_row_num + n)+"\">\n";
    tag +="<td align=\"center\">"+((new_row_num + n) +1)+"</td>\n";
    tag +="<td>\n";
    tag +="<input type=\"hidden\" name=\"cma_num[]\" id=\"cma_num"+(new_row_num + n)+"\" value=\""+(new_row_num + n)+"\" />\n";
    tag +="<input type=\"text\" name=\"cma_text[]\" id=\"cma_text"+(new_row_num + n)+"\" value=\"내용 "+(new_row_num+1)+"\" />\n";
    tag +="</td>\n";
    tag +="</td>\n";
    tag +="<td>\n";
    tag +="<input type=\"button\" value=\"아래로\" onclick=\"movedown('cma_text[]','cma_num[]','cma_text_value','tr_id',"+(new_row_num + n)+");\" />\n";
    tag +="<input type=\"button\" value=\"위로\" onclick=\"moveup('cma_text[]','cma_num[]','cma_text_value','tr_id',"+(new_row_num + n)+");\" />\n";
    tag +="<input type=\"button\" value=\"삭제\" onclick=\"deleterow('cma_text[]','cma_num[]','cma_text_value','tr_id',"+(new_row_num + n)+");\" />\n";
    tag +="</td>\n";
    tag +="</tr>\n";
  
    $("#"+obj).append(tag);
    new_row_num++;
    addBasicData('cma_text[]','cma_text_value');
}
  
function moveup(ctext,cnum,tval,obj,n) {
    $("#"+obj+n).insertBefore($("#"+obj+n).prev());
    checkTableForm(ctext,cnum,tval,obj,n,'up');
}
  
function movedown(ctext,cnum,tval,obj,n) {
    $("#"+obj+n).insertAfter($("#"+obj+n).next());
    checkTableForm(ctext,cnum,tval,obj,n,'down');
}
  
function deleterow(ctext,cnum,tval,obj,n) {
    $("#"+obj+n).remove();
    $("#num_rows").val(--num_rows);
    addBasicData(ctext,tval);
}
  
function addBasicData(ctext,tval) {
    var i, tag=[];
    var tmp_text = document.getElementsByName(ctext);
    var tot = tmp_text.length;
    for (i = 0; i < tot; i++) {
        tag[i] = tmp_text[i].value;
    }
    document.getElementById(tval).value = tag.join(",");
}
  
function checkTableForm(ctext,cnum,tval,obj,n,stype) {
    var i, tag=[];
    var tmp_text = document.getElementsByName(ctext);
    var tmp_num = document.getElementsByName(cnum);
    var tot = tmp_text.length;
    tot = (stype == "delete") ? (tot-1) : tot;
    for (i = 0; i < tot; i++) {
        document.getElementById(obj+tmp_num[i].value).style.backgroundColor = "#fff";
        tag[i] = tmp_text[i].value;
    }
    document.getElementById(obj+n).style.backgroundColor = "#ffff80";
    document.getElementById(tval).value = tag.join(",");
}
</script>
  
<table border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC" id="table_list">
    <thead>
        <tr bgcolor="#ffff8e">
            <th colspan="3" style="text-align:left;">
                <input type="text" name="cma_text_value" id="cma_text_value" value="" size="40" readonly="readonly" />
                &nbsp;
                <button type="button" id="btn-add-row" onclick="add_new_row('table_list',0);">행 추가</button>
            </th>
        </tr>
        <tr bgcolor="#f5f5f5">
            <th>번호</th>
            <th>제목</th>
            <th>관리</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>