/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package employees;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Cadu
 */
public class HourlyEmployeeTest {
    
    public HourlyEmployeeTest() {
    }
    
    @BeforeAll
    public static HourlyEmployee setUpClass() {
        String name = "Henrique";
        String CPF = "23454387965";
        int workedHours = 20;
        int valuePerHour = 50;
        Addres addres = new Addres("DF", "Brasilia", "Asa Sul", "SQS 415", "204");
        return new HourlyEmployee(name, CPF, addres, workedHours, valuePerHour);
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

    /**
     * Test of calculateSalary method, of class HourlyEmployee.
     */
    @Test
    public void testCalculateSalary() {
        int increasePercentage = 20;
        HourlyEmployee employee = setUpClass();
        
        float generated = employee.calculateSalary(increasePercentage);
        
        float expected = 1200;
        assertEquals(expected, generated);
    }
    
}
