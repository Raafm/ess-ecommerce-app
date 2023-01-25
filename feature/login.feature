Cenário de GUI
Scenario: Login Correto
    Given Estou na pagina "Inicial" da aplicação sem estar logado
    When Eu preencho o campo de login, com o "Usuario" e "Senha" corretos e confirmo 
    Then o usuario recebe um pop up inicando que o login foi realizado com sucesso 
    And é direcionado para a página do usuario

Cenário de Serviço
Scenario: Login Correto
    Given o Usuario "Rafael" não está logado
    When o usuario preenche os campos de "Usuario" com o "Email" ou entao com "Nome" 
    And preenche o campo de senha com a senha correta e confirma 
    Then o Usuario realiza o login

Cenario de GUI
Scenario: Login incorreto
    Given 
