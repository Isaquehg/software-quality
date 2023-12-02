package gorest;

import com.intuit.karate.junit5.Karate;

class GoRestRunner {
    
    @Karate.Test
    Karate testReqRes() {
        return Karate.run("gorest").relativeTo(getClass());
    }    

}