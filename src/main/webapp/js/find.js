   function goData() {
     var form = document.apply;
     
     form.submit();
   }
   function getQueryStringObject() {
     var a = window.location.search.substr(1).split('&');
     if (a == "") return {};
     var b = {};
     for (var i = 0; i < a.length; ++i) {
         var p = a[i].split('=', 2);
         if (p.length == 1)
             b[p[0]] = "";
         else
             b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
     }
     return b;
 }

 var gq = getQueryStringObject()
 var planNo = gq.planNo;
 console.log(planNo);
 var eventData = [];
 function ajaxGo() {
   eventData = [];
   $.ajax({
     type : "GET",
     url : "../plan/find?planNo=" + planNo,
     async: false,
     data : {
       num : $("select[name=num]").val()
     },
     datatype : "JSON",
     success : function(obj) {
       console.log(obj);
       for (let a of obj) {
         eventData.push({
           memberName : a.memberName,
           attend : a.attend
         });
       }
     }
   });
   console.log(eventData);
 }
 var event = ajaxGo();
 console.log("eventData: " +  eventData);
console.log(eventData);

function tableCreate(){

  var tc = new Array();
  var html = '';
  for (let b of eventData){
  tc.push({name : b.memberName, attend : b.attend }); 
  }
  for(key in tc){
  html += '<tr>';
  html += '<td align=left>'+tc[key].name+'</td>';
//  html += '<td>'+tc[key].attend+'</td>';
  html += '</tr>';
  }
        
  $("#dynamicTbody").empty();
  $("#dynamicTbody").append(html);
  }
window.onload = tableCreate();