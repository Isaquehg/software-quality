package reqres;

import com.intuit.karate.junit5.Karate;

class ReqResRunner {
    
    @Karate.Test
    Karate testReqRes() {
        return Karate.run("reqres").relativeTo(getClass());
    }    

}