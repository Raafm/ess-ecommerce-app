Feature: Login no aplicativo
    As a usuario do aplicativo
    I want to entrar no aplicativo com meu e-mail e senha cadastrado
    So that eu tenha acesso às funcionalidades do sistema que são acessíveis somente depois do login

Scenario: Login correto
    Given Não estou logado com nenhum usuário na aplicação
        And existe um usuario cadastrado com o email "teste@gmail.com" e senha "123456"
        And estou na página de "login"
    When o campo de email é preenchido com "teste@gmail.com"
        And com a senha "123456"
        And tenta acessar o aplicativo
    Then o usuario é encaminhado para o aplicativo

Scenario: Login Incorreto
    Given Não estou logado com nenhum usuário na aplicação
           And existe um usuario cadastrado com o email "teste@gmail.com" e senha "123456"
           And estou na página de "login"
    When o campo de e-mail é preenchido por "test@gmail.com"
        And o campo da senha é preenchido por "1234"
        And tento entrar no sistema
    Then eu recebo uma mensagem de erro 
        And eu continuo na página de login

Scenario: Esqueceu a senha
    Given Não estou logado com nenhum usuário na aplicação
        And esqueci a senha
        And estou na página de "login"
    When clico na opção de Esqueceu a senha
    Then sou encaminhado para uma pagina de esqueci a senha
        And preencho o campo de email ou usuario com o email "teste@gmail.com"
        And seleciono recuperar a senha 


Scenario: Esqueceu o usuário
    Given Não estou logado com nenhum usuário na aplicação
        And esqueci o usuário
        And estou na página de "login"
    When clico na opção de Esqueceu o usuario
    Then sou encaminhado para uma pagina de esqueci o usuario
        And preencho o campo de email com "teste@gmail.com"
        And seleciono recuperar o usuario