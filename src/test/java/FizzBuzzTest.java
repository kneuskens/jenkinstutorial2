import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class FizzBuzzTest {

    FizzBuzz fizzBuzz;

    @Before
    public void setup() {
        fizzBuzz = new FizzBuzz();
    }

    @Test
    public void return1For1() {
        assertEquals("1", fizzBuzz.validateFizzBuzz(1));
    }

    @Test
    public void return2For2() {
        assertEquals("2", fizzBuzz.validateFizzBuzz(2));
    }

    @Test
    public void returnFizzFor3() {
        assertEquals("Fizz", fizzBuzz.validateFizzBuzz(3));
    }
}
