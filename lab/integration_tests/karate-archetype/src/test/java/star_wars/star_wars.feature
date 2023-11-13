Feature: Executar testes de API em swapi

Scenario: Testar retorno da Star Wars API https://swapi.dev/api/people/1
    Given url 'https://swapi.dev/api/people/1'
    When method get
    Then status 200

Scenario: Testar retorno da swapi, com request inválido https://swapi.dev/api/planets/5802
    Given url 'https://swapi.dev/api/planets/5802'
    When method get
    Then status 404
    