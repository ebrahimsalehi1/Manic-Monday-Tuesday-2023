package com.ebrahim.salehi.Hello;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.mockConstruction;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.ebrahim.salehi.demotests.service.EmployeeOp;
import com.ebrahim.salehi.demotests.service.EmployeeService;

@ExtendWith(MockitoExtension.class)
public class AddExampleTest {

    @Mock
    EmployeeService employeeService;
    /**
     * 
     */
    @Test
    public void addMethodTest(){
        EmployeeOp employeeOp = new EmployeeOp();
        int actualResult = employeeOp.add(10, 20);
        assertEquals(actualResult, 30);
    }

    @Test
    public void listCountTest(){
        EmployeeOp employeeOp = new EmployeeOp();
        long actualResult = employeeOp.listCount(List.of(new Integer[]{1,2,3}));
        assertEquals(actualResult, 3);
    }

    @Test 
    public void listSumTest(){
        EmployeeOp employeeOp = new EmployeeOp();
        long actualSum = employeeOp.listSum(List.of(new Integer[]{1}));
        assertEquals(actualSum, 1);
    }

    @Test
    public void retrieveDataTest(){
        // EmployeeService employeeService=mock(EmployeeService.class);
        when(employeeService.retrieveData()).thenReturn(List.of(new String[]{"one","two","three"}));

        assertEquals(employeeService.retrieveData(), List.of(new String[]{"one","two","three"}));
    }
    
}
