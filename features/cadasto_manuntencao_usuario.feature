Feature: Cadastro e manuntenção de usuários

Scenario: Cadastro com CPF já utilizado
Given que o CPF "897.234.188-50" está cadastrado no sistema
And o usuário "Marilu Andrade" está na página de "cadastro"
When o usuário "Marilu Andrade" tenta cadastrar o nome "Marilu Andrade", CPF "897.234.188-50", email "marilu@mail.com", senha "1234567a" e método de pagamento "PIX"
Then o usuário "Marilu Andrade" recebe uma mensagem de aviso "Usuário já cadastrado."

Scenario: Cadastro com email já utilizado
Given que o email "bezaliel@mail.com" está cadastrado no sistema
And o usuário "Bezaliel Silva" está na página de "cadastro" 
When o usuário "Bezaliel Silva" tenta cadastrar o nome "Bezaliel Silva", CPF "780.008.654-91", email "bezaliel@mail.com", senha "7654321b" e método de pagamento "Crédito" com número de cartão "0004"
Then o usuário "Bezaliel Silva" recebe uma mensagem de aviso "Email já cadastrado."

Scenario: Cadastro com senha inválida
Given que o CPF "673.982.123-79" não está cadastrado no sistema
And o usuário "Priscila Pimenta" está na página de "cadastro"
When o usuário "Priscila Pimenta" tenta cadastrar o nome "Priscila Pimenta", CPF "673.982.123-79", email "pri@mail.com", senha "000c" e método de pagamento "Cŕedito" com número de cartão "9989"
Then o usuário "Priscila Pimenta" recebe uma mensagem de aviso "Formato de senha inválido. Por favor, siga as recomendações e tente novamente. "

Scenario: Cadastro com email inválido 
Given que o CPF "787.898.090-11" não está cadastrado no sistema
And o usuário "José Carlos" está na página de "cadastro" 
When o usuário "José Carlos" tenta cadastrar o nome "José Carlos", CPF "787.898.090-11", email "teste1", senha "0000222d" e método de pagamento "PIX"
Then o usuário "José Carlos" recebe uma mensagem de aviso "Formato de email inválido. Por favor, siga as recomendações e tente novamente."

Scenario: Cadastro com dados obrigatórios incompletos
Given que o CPF "889.766.456-44" não está cadastrado no sistema
And o usuário "Alana Silva" está na página de "cadastro" 
When o usuário "Alana Silva" tenta cadastrar o nome "Alana Silva" com CPF "889.766.456-44" e email "alana@mail.com" com senha "1113333a"
Then o usuário "Alana Silva" recebe uma mensagem de aviso "Por favor, preencha todos os dados obrigatórios e tente novamente."

Scenario: Cadastro com dados obrigatórios corretos
Given que o CPF "889.766.456-44" não está cadastrado no sistema
And o usuário "Alana Silva" está na página de "cadastro" 
When o usuário "Alana Silva" tenta cadastrar o nome "Alana Silva", CPF "889.766.456-44", email "alana@mail.com", senha "1113333a" e método de pagamento "Cŕedito" com número de cartão "9111"
Then o usuário "Alana Silva" é cadastrado no sistema
And o usuário "Alana Silva" recebe uma mensagem de aviso "Cadastro realizado com sucesso."
And o usuário "Alana Silva" é redirecionado para a página de "login"

Scenario: Cadastro com dados obrigatórios e não obrigatórios corretos
Given que o CPF "111.222.333-44" não está cadastrado no sistema
And o usuário "Clara Acrucha" está na página de "cadastro" 
When o usuário "Clara Acrucha" tenta cadastrar o nome "Clara Acrucha", CPF "111.222.333-44", email "acrucha@teste.com", senha "0101020c", método de pagamento "PIX", nome de usuário "acrucha", número de celular "81999223344" e endereço "Avenida Acrucha 5"
Then o usuário "Clara Acrucha" é cadastrado no sistema
And o usuário "Clara Acrucha" recebe uma mensagem de aviso "Cadastro realizado com sucesso."
And o usuário "Clara Acrucha" é redirecionado para a página de "login"

Scenario: Tentativa de remoção de conta com inserção de senha incorreta 
Given que o CPF "889.766.456-44" está cadastrado no sistema
And o usuário "Alana Silva" está na página de "perfil"
When o usuário "Alana Silva" tenta deletar sua conta 
And o usuário "Alana Silva" recebe uma mensagem de aviso "Por favor, insira a sua senha."
And o usuário "Alana Silva" insere a senha "deletar"
Then o usuário "Alana Silva" recebe uma mensagem de aviso "Senha incorreta, por favor, tente novamente."

Scenario: Remoção de conta com inserção de senha correta 
Given que o CPF "889.766.456-44" está cadastrado no sistema
And o usuário "Alana Silva" está na página de "perfil"
When o usuário "Alana Silva" tenta deletar sua conta 
And o usuário "Alana Silva" recebe uma mensagem de aviso "Por favor, insira a sua senha."
And o usuário "Alana Silva" insere a senha "1113333a"
Then o usuário "Alana Silva" é removido do sistema 
And o usuário "Alana Silva" é redirecionado para a página de "login"

Scenario: Atualização de cadastro 
Given que o CPF "111.222.333-44" está cadastrado no sistema 
And o usuário "Clara Acrucha" está na página de "perfil"
When o usuário "Clara Acrucha" tenta editar seus "dados pessoais" 
And atualiza e salva seu "nome" para "Acruchinha"
Then o "nome" do usuário "Clara Acrucha" é atualizado para "Acruchinha"
And o usuário "Acruchinha" está na página de "perfil" atualizada

Scenario: Adição de endereço 
Given que o CPF "111.222.333-44" está cadastrado no sistema 
And o usuário "Clara Acrucha" está na página de "perfil"
When o usuário "Clara Acrucha" tenta editar seus "endereços"
And adiciona e salva um "endereço" "Avenida Acruchinha 1"
Then um novo endereço "Avenida Acruchinha 1" é adicionado ao perfil de "Clara Acrucha"
And o usuário "Clara Acrucha" está na página de "perfil" atualizada

Scenario: Remoção de endereço 
Given que o CPF "111.222.333-44" está cadastrado no sistema 
And o usuário "Clara Acrucha" está na página de "perfil"
When o usuário "Clara Acrucha" tenta deletar o endereço "Avenida Acrucha 5"
And o usuário "Clara Acrucha" recebe uma mensagem de aviso "Tem certeza que deseja deletar o endereço?"
And o usuário "Clara Acrucha" confirma a remoção do endereço "Avenida Acrucha 5"
Then um o "endereço" "Avenida Acrucha 5" do usuário "Clara Acrucha" é removido
And o usuário "Clara Acrucha" está na página de "perfil" atualizada
