package com.ebrahim.salehi.demotests.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ebrahim.salehi.demotests.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee,Long>  {
    
}
