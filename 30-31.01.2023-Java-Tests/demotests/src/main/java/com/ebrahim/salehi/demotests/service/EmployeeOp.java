package com.ebrahim.salehi.demotests.service;

import java.util.List;

public class EmployeeOp {
    public int add(int x,int y){
        return x+y;
    }

    public long listCount(List<Integer> list){
        return list.stream().count();
    }

    public long listSum(List<Integer> list){        
        return list.stream().reduce(0, (arg0, arg1) -> Integer.sum(arg0, arg1));
    }
}
