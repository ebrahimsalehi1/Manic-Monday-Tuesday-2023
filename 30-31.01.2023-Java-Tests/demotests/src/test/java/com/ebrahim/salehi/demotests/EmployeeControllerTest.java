package com.ebrahim.salehi.demotests;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.ebrahim.salehi.demotests.service.EmployeeService;

@SpringBootTest
@AutoConfigureMockMvc
public class EmployeeControllerTest {
    
    @Autowired
    private MockMvc mockmvc;

    @Test
    public void getHelloWorldTest(){
        RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/employee/all").accept(MediaType.APPLICATION_JSON);
        try {
            String expectedValue = "Hello Worlds !!!!";
            MvcResult result = mockmvc.perform(requestBuilder)
            .andExpect(MockMvcResultMatchers.status().is(200))
            .andExpect(MockMvcResultMatchers.content().string(expectedValue))
            .andReturn();

            assertEquals(result.getResponse().getContentAsString(), expectedValue);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @MockBean
    private EmployeeService employeeService;

    @Test 
    public void getEmployeeByIdTest() throws Exception{
        when(employeeService.getById(10)).thenReturn(10);
       RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/employee/10").accept(MediaType.APPLICATION_JSON);
        mockmvc.perform(requestBuilder).andExpect(MockMvcResultMatchers.status().is(200))
           .andExpect(MockMvcResultMatchers.content().string("10"))
           .andReturn();


    }
}
