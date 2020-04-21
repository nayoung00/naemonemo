package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.PlanDao;
import com.nmnm.gms.domain.Plan;
import com.nmnm.gms.service.PlanService;

@Component
public class PlanServiceImpl implements PlanService {

  PlanDao planDao;

  public PlanServiceImpl(PlanDao planDao) {
    this.planDao = planDao;

  }

  @Override
  public Plan get(int planBoardNo) throws Exception {
    return planDao.findByNo(planBoardNo);
  }

  @Override
  public int add(Plan plan) throws Exception {
    return planDao.insert(plan);
  }

  @Override
  public int delete(int planBoardNo) throws Exception {
    return planDao.delete(planBoardNo);
  }

  @Override
  public List<Plan> list() throws Exception {
    return planDao.findAll();
  }


  @Override
  public int update(Plan plan) throws Exception {
    return planDao.update(plan);
  }

}
