package com.ebrahim.salehi.demotests.fortest;

public class ForTest {

    public int divideCalculation(int x,int y) throws Exception{
        if(y==0)
            throw new Exception("Division by zero");
        return x/y;
    }
    
}
