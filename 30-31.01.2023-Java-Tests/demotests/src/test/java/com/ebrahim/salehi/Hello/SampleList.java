package com.ebrahim.salehi.Hello;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

public class SampleList {
    @Test
    public void test(){
        List mock = Mockito.mock(List.class);
        when(mock.size()).thenReturn(10);
        when(mock.get(0)).thenReturn("one");
        assertEquals(mock.size(), 10);
        assertEquals(mock.get(0), "one");
    }
}
