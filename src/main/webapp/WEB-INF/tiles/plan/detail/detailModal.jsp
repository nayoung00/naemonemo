<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
    
    
<!-- Modal -->
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="apply" action="apply" method="GET">
        <input type="hidden" name="planNo" value="${param.planNo}" />
        <input type="hidden" name="memberNo" value="${loginUser.memberNo}" />
        <input type="hidden" name="groupNo" value="${plan.groupNo}" />
        <input type="hidden" name="attend" value="참가" />
        일정에 참여하시겠습니까? 
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="goData()">참여하기</button>
      </div>
        </form>
      </div>

    </div>
  </div>
</div>