package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.PlanDao;
import com.nmnm.gms.domain.Plan;
import com.nmnm.gms.domain.PlanMember;
import com.nmnm.gms.service.PlanService;

@Component
public class PlanServiceImpl implements PlanService {

  PlanDao planDao;

  public PlanServiceImpl(PlanDao planDao) {
    this.planDao = planDao;

  }

  @Override
  public Plan get(int planNo) throws Exception {
    return planDao.findByNo(planNo);
  }

  @Override
  public int add(Plan plan) throws Exception {
    return planDao.insert(plan);
  }

  @Override
  public int delete(int planNo) throws Exception {
    return planDao.delete(planNo);
  }

  @Override
  public List<Plan> list(int groupNo) throws Exception {
    return planDao.findAll(groupNo);
  }

  @Override
  public List<Plan> calendar(int groupNo) throws Exception {
    return planDao.findByCalendar(groupNo);
  }


  @Override
  public int update(Plan plan) throws Exception {
    return planDao.update(plan);
  }

  @Override
  public List<Plan> search(String keyword) throws Exception {
    return planDao.findByKeyword(keyword);
  }

  @Override
  public int apply(PlanMember planMember) throws Exception {
    return planDao.applyPlanMember(planMember);
  }

  @Override
  public List<Plan> find(int planNo) throws Exception {
    return planDao.findPlanMember(planNo);
  }
}
