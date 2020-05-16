package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Plan;

public interface PlanService {
  Plan get(int planNo) throws Exception;

  int add(Plan plan) throws Exception;

  int delete(int planNo) throws Exception;

  List<Plan> list() throws Exception;

  int update(Plan plan) throws Exception;

  List<Plan> search(String keyword) throws Exception;

}
