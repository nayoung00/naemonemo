package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.Plan;
import com.nmnm.gms.domain.PlanMember;

public interface PlanDao {

  int insert(Plan plan) throws Exception;

  List<Plan> findAll(int groupNo) throws Exception;

  List<Plan> findByCalendar(int groupNo) throws Exception;

  Plan findByNo(int planNo) throws Exception;

  int update(Plan plan) throws Exception;

  int delete(int planNo) throws Exception;

  List<Plan> findByKeyword(String keyword) throws Exception;

  int applyPlanMember(PlanMember planMember) throws Exception;

  List<PlanMember> findPlanMember(int planNo) throws Exception;
}
