package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Plan;

public interface PlanService {
  Plan get(int planBoardNo) throws Exception;

  int add(Plan plan) throws Exception;

  int delete(int planBoardNo) throws Exception;

  List<Plan> list() throws Exception;

  int update(Plan plan) throws Exception;

}
