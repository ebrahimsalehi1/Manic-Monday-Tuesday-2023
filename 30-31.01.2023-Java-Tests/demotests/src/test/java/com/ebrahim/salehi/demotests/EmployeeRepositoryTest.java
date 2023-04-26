package com.ebrahim.salehi.demotests;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertThrowsExactly;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import java.util.Optional;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ebrahim.salehi.demotests.model.Employee;
import com.ebrahim.salehi.demotests.repository.EmployeeRepository;
import com.ebrahim.salehi.demotests.service.EmployeeService;

@SpringBootTest
public class EmployeeRepositoryTest {

    @Autowired
    EmployeeService employeeService;
    
    @InjectMocks
    EmployeeService employeeServiceMock;


    @Mock
    EmployeeRepository employeeRepository;

    @Test
    public void employeeRealSaveAndRetrieveTest() throws Exception{
        Employee expectedValue = new Employee(10l,"EBRAHIM");        
        employeeService.saveEmployee(expectedValue);
        Employee actuelValue = employeeService.getEmployeeById(10l);

        assertEquals(expectedValue, actuelValue);
    }

    @Test
    public void employeeMockeSaveAndRetrieveTest() throws Exception{

        Employee expectedValue = new Employee(10l,"EBRAHIM");        
        when(employeeRepository.save(any())).thenReturn(expectedValue);
        employeeServiceMock.saveEmployee(expectedValue);

        when(employeeRepository.findById(any())).thenReturn(Optional.of(expectedValue));
        Employee actuelValue = employeeServiceMock.getEmployeeById(10l);

        assertEquals(expectedValue, actuelValue,()->"Error Happened Here !!!");
    }

    @Test
    @DisplayName("Chek For Duplications")
    public void checkDuplicateIdTest() throws Exception{
        Employee expectedValue = new Employee(1l,"Ebrahim");

        Exception exception=assertThrows(Exception.class,()->{
            employeeService.saveEmployee(expectedValue);
            employeeService.saveEmployee(expectedValue);
        });
        assertEquals(exception.getMessage(), "Duplicated");
    }

}
