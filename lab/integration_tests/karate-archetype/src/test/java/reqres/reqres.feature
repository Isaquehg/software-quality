Feature: Executar testes na API ReqRes


Background: Executa antes de cada teste
    * def url_base = 'https://reqres.in/api'
    * def request_json_1 = read('./request_json.json')
    * def request_json_2 = read('./request_json2.json')
    * def request_json_3 = read('./request_json3.json')


Scenario: Testar retorno com sucesso de usuarios cadastrados em reqres.in/api/users
    Given url url_base
    And path 'users'
    When method get
    Then status 200

Scenario: Testar retorno de pagina especifica de usuarios em reqres.in/api/users?page=2
    Given url url_base
    And path 'users?page=2'
    When method get
    Then status 200
    And match $.page == '#number'

Scenario: Testar cadastro de usuario em reqres.in/api/users
    Given url url_base
    And path 'users'
    And request { "name": "garry", "job": "developer" }
    When method post
    Then status 201
    And match $.name == "garry"
    And match $.job == '#string'

Scenario: Testar login com sucesso em reqres.in/api/login
    Given url url_base
    And path 'login'
    And request { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    When method post
    Then status 200
    And match $.token == '#string'

Scenario: Testar retorno com usuario nao cadastrado em reqres.in/api/users/2023
    Given url url_base
    And path 'users/2023'
    When method get
    Then status 404

Scenario: Testar retorno com falha de cadastro de usuario sem senha em reqres.in/api/register
    Given url url_base
    And path 'register'
    And request { "email": "darry@darrymail.com" }
    When method post
    Then status 400
    And match $.error == "Missing password"
    