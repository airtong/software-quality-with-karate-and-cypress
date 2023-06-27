package goRestAPI;

import com.intuit.karate.junit5.Karate;

public class goRunner {
    
    @Karate.Test
    Karate testGoRest() {
        return Karate.run("go").relativeTo(getClass());
    }    
}
