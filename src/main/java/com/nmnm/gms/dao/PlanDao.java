package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.Plan;

public interface PlanDao {

  int insert(Plan plan) throws Exception;

  List<Plan> findAll() throws Exception;

  Plan findByNo(int planNo) throws Exception;

  int update(Plan plan) throws Exception;

  int delete(int planNo) throws Exception;

  List<Plan> findByKeyword(String keyword) throws Exception;

}
