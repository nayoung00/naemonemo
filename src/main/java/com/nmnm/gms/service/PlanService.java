package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Plan;
import com.nmnm.gms.domain.PlanMember;

public interface PlanService {
  Plan get(int planNo) throws Exception;

  int add(Plan plan) throws Exception;

  int delete(int planNo) throws Exception;

  List<Plan> list(int groupNo) throws Exception;

  List<Plan> calendar(int groupNo) throws Exception;

  int update(Plan plan) throws Exception;

  List<Plan> search(String keyword) throws Exception;

  int apply(PlanMember planMember) throws Exception;

  List<PlanMember> find(int planNo) throws Exception;
}
