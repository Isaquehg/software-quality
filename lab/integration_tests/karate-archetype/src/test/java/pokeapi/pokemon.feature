Feature: Executar testes de API em pokeapi.co

Background: Executa antes de cada teste
    * def url_base = 'https://pokeapi.co/api/v2/'

Scenario: Testar retorno com sucesso de pokeapi.co https://pokeapi.co/api/v2/pokemon/ditto
    Given url url_base
    And path 'pokemon/ditto'
    When method get
    Then status 200

Scenario: Testar retorno de falha de pokeapi.co https://pokeapi.co/api/v2/pokemon/nao_existe
    Given url url_base
    And path 'pokemon/larry'
    When method get
    Then status 404


Scenario: Testar busca do efeito da habilidade do pokemon 3 de pokeapi.co https://pokeapi.co/api/v2/pokemon/3
    Given url url_base
    And path 'pokemon/3'
    When method get
    Then status 200
    And def efeito = $.abilities[0].ability.url
    And print efeito
    And url efeito
    When method get
    Then status 200
    And match $.effect_entries[0].effect == "When this Pokémon has 1/3 or less of its HP remaining, its grass-type moves inflict 1.5× as much regular damage."

