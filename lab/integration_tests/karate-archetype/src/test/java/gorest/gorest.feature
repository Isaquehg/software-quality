Feature: Executar testes na API GoREST


Background: Executa antes de cada teste
    * def url_base = 'https://gorest.co.in/public/v2'
    * def token = '57f87ca44c4918a5e32127f51b8fba33b15caa306e67513fb4a63f28b723ac0a'

    
Scenario: Testar retorno de array de usuarios em gorest.co.in/public/v2/users
    Given url url_base
    And path 'users'
    When method get
    Then status 200
    And match $ == '#[]'

Scenario: Criar usuario com Bearer token em gorest.co.in/public/v2/users
    Given url url_base + '/users'
    And request { "name": "Darry", "gender": "Male", "email": "darry@barrymail.com", "status": "Active" }
    And header Authorization = 'Bearer ' + token
    When method post
    Then status 201

Scenario: Criar post para usuario criado em gorest.co.in/public/v2/users/5803079/posts
    Given url url_base
    And path 'users/5803079/posts'
    And request { "user_id":5803725,"title":"Cupiditate surculus considero suasoria turbo creber commemoro.","body":"Uredo cruciamentum sui. Cultura agnosco expedita. Ea derelinquo eligendi. Sunt cibo solium. Strues quo cur. Copia vulgo trucido. Ratione fuga quo. Adamo ipsum tripudio. Quia arceo adhaero. Cohibeo trepide strues. Nobis cubitum cruentus. Quam pauper brevis. Aggredior ratione utrum. Angulus sum provident. Vilicus utrimque aptus. Minus canto versus. Somniculosus umbra audeo."}
    And header Authorization = 'Bearer ' + token
    When method post
    Then status 201

Scenario: Testar retorno com usuario nao cadastrado em gorest.co.in/public/v2/users
    Given url url_base
    And path 'users/2023'
    When method get
    Then status 404

Scenario: Testar buscar todo nao existente em gorest.co.in/public/v2/users/1830411/todos
    Given url url_base
    And path 'users/1830411/todos'
    When method get
    Then status 200
    And match $[0].user_id == 1830411
    