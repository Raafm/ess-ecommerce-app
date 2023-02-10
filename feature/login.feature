Feature: Login no aplicativo
    As a usuario do aplicativo
    I want to entrar no aplicativo com meu e-mail e senha cadastrado
    So that eu tenha acesso às funcionalidades do sistema que são acessíveis somente depois do login

Scenario: Login correto
    Given Não estou logado com nenhum usuário na aplicação
        And existe um usuario cadastrado com o email "anaoblindado@gmail.com" e senha "123456"
        And estou na página inicial e  "login"
    When o campo de email é preenchido com "anaoblindado@gmail.com"
        And com a senha "123456"
        And tenta acessar o aplicativo
    Then o usuario recebe uma mensagem dizendo login feito com sucesso
        And o usuario é encaminhado para o aplicativo

Scenario: Login admin
    Given Não estou logado com nenhum usuário na aplicação
        And existe um admin cadastrado com o email "admin@gmail.com" e senha "admin"
        And estou na página inicial e "login"
    When o campo de email é preenchido com "admin@gmail.com"
        And com a senha "admin"
        And tenta acessar o aplicativo
    Then o admin recebe uma mensagem dizendo login feito com sucesso
        And o admin é encaminhado para a pagina do administrador

Scenario: Login com a senha errada
    Given Não estou logado com nenhum usuário na aplicação
           And existe um usuario cadastrado com o email "anaoblindado@gmail.com" e senha "123456"
           And estou na página de "login"
    When o campo de e-mail é preenchido por "anaoblindado@gmail.com"
        And o campo da senha é preenchido por "1234"
        And tento entrar no sistema
    Then eu recebo uma mensagem de erro dizendo que a senha está errada
        And eu continuo na página de login

Scenario: Login com a email errado
    Given Não estou logado com nenhum usuário na aplicação
           And existe um usuario cadastrado com o email "anaoblindadex@gmail.com" e senha "123456"
           And estou na página de "login"
    When o campo de e-mail é preenchido por "test@gmail.com"
        And o campo da senha é preenchido por "123456"
        And tento entrar no sistema
    Then eu recebo uma mensagem de erro dizendo que o email está incorreto
        And eu continuo na página de login


Scenario: Esqueceu a senha
    Given Não estou logado com nenhum usuário na aplicação
        And esqueci a senha
        And estou na página de "login"
    When seleciono na opção de Esqueceu a senha
    Then sou encaminhado para uma pagina de esqueci a senha
        And preencho o campo de email ou usuario com o email "anaoblindado@gmail.com"
        And seleciono recuperar a senha 
    Then sou encaminhado para a pagina de recuperar a senha

Scenario: Recuperar a senha
    Given o usuario esta na pagina de recuperar a senha
        And recebeu o codigo de recuperar a senha 
    When ele preenche o campo de codigo para recuperar a senha
    Then preenche com a senha nova 
        And seleciona concluir
    Then é encaminhado para a pagina de login 