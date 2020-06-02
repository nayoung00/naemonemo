<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <!-- footer-->
   <footer class="footer">
       <div class="container-fluid">
           <p class="copyright pull-right">
               &copy; <script>document.write(new Date().getFullYear())</script> <a href="index.html">네모내모 플랜만</a>
           </p>
       </div>
   </footer>
    
    
    <!--   Core JS Files   -->
    <script src="${pageContext.servletContext.getContextPath()}/js/jquery.3.2.1.min.js" type="text/javascript"></script>
  <script src="${pageContext.servletContext.getContextPath()}/js/bootstrap.min.js" type="text/javascript"></script>

  <script>
  $(".author").click(function(){
    $("input[name='thumbnailFile']").click();
    console.log($("input[name='thumbnailFile']"));
});

// 이미지 업로드시 나타게
function readURL(input) {
  if (input.files && input.files[0]) {
  var reader = new FileReader();
  reader.onload = function (e) {
  $('#blah').attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
  }
  }
  
  </script>
  <!--  Charts Plugin -->
  <script src="${pageContext.servletContext.getContextPath()}/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="${pageContext.servletContext.getContextPath()}/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
  <script src="${pageContext.servletContext.getContextPath()}/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

