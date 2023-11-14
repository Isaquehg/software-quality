package pokeapi;

import com.intuit.karate.junit5.Karate;

class PokemonRunner {

    @Karate.Test
    Karate testPokemon() {
        return Karate.run("pokemon").relativeTo(getClass());
    }  

}