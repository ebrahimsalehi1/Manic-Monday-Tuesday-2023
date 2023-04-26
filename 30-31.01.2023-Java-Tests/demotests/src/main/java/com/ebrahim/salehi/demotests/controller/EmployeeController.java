package com.ebrahim.salehi.demotests.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ebrahim.salehi.demotests.model.Employee;
import com.ebrahim.salehi.demotests.service.EmployeeService;

@RestController
@RequestMapping(value="/employee")
public class EmployeeController {


    @Autowired
    EmployeeService employeeService;
    
    @GetMapping("/all")
    public String getHelloWorld(){
        return "Hello Worlds !!!!";
    }

    @GetMapping("/{id}")
    public Integer getById(@PathVariable Integer id){        
        return employeeService.getById(id);
    }

    @PostMapping("/save")
    public Employee saveEmployee(@RequestBody Employee employee) throws Exception{
        System.out.println(employee.toString());
        return employeeService.saveEmployee(employee);
    }
    
}
