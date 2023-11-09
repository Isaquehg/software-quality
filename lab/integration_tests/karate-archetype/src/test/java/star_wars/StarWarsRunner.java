package starwars;

import com.intuit.karate.junit5.Karate;

class StarWarsRunner {
    
    @Karate.Test
    Karate testStarWars() {
        return Karate.run("star_wars").relativeTo(getClass());
    }    

}