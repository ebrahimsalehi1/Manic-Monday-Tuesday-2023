package com.ebrahim.salehi.demotests.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebrahim.salehi.demotests.model.Employee;
import com.ebrahim.salehi.demotests.repository.EmployeeRepository;

@Service
public class EmployeeService {

  @Autowired
  EmployeeRepository employeeRepository;

  public List<String> retrieveData()  {
    return List.of(new String[]{"one","two","three"});
  } 

  public Integer getById(Integer id){        
    return (new Random().nextInt(1, id));
  }

  public Employee saveEmployee(Employee employee) throws Exception{
    if(employeeRepository.findById(employee.getId()).isPresent())
      throw new Exception("Duplicated");
    else
      return employeeRepository.save(employee);
  }

  public Employee getEmployeeById(Long id){    
    return employeeRepository.findById(id).get();
  }

}
