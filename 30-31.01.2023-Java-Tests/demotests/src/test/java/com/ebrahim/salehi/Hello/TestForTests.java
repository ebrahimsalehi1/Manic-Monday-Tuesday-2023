package com.ebrahim.salehi.Hello;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.ValueSource;

import com.ebrahim.salehi.demotests.fortest.ForTest;

public class TestForTests {

    private ForTest forTest;

    @BeforeEach
    public void beforeEachTestMethod(){
        forTest = new ForTest();
    }

    @Test
    @DisplayName("division calculation by test")
    @ParameterizedTest
    @MethodSource
    @CsvSource({"3,1,3","2,2,1"})
    public void divisionCalculationTest(int x,int y,int result) throws Exception{
        int actuelValue = forTest.divideCalculation(x, y);
        assertEquals(actuelValue, result);
    }

    private static Stream<Arguments> divisionCalculationTest(){
        return Stream.of(
            Arguments.of(20,10,2),
            Arguments.of(30,15,2),
            Arguments.of(2,2,2)
        );
    }
    
}
