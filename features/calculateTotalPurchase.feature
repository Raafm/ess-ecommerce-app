Feature: Estatísticas

Scenario: Ver estatÍstica geral
Given Eu sou o user admin “Acruchi”
And Eu estou na página do admin
And A média, o máximo e o mínimo do valores das compras (no tempo) são respectivamente "15000", "20000" e "10000"
Then eu vejo  "15000", "20000" e "10000" como, respectivamente, a média, o máximo e o mínimo do valor das compras (no tempo)

Scenario: Ver estatística por pedido
Given Eu sou o user admin “Acruchi”
And Eu estou na página de administrador 
And A média, o máximo e o mínimo do valores das compras (por pedido) são respectivamente "150", "200" e "100"
When  Eu acesso a aba de dados por pedido
Then eu vejo  "150", "200" e "100" como, respectivamente, a média, o máximo e o mínimo dos valores das compras em cada pedidos

Scenario: Ver estatística dos cancelados
Given Eu sou o user admin “Acruchi”
And Eu estou na página de administrador 
And A média, o máximo e o mínimo do valores das compras canceladas (por pedido) são respectivamente "150", "200" e "100"
When  Eu acesso a aba de dados para pedidos cancelados
Then eu vejo  "150", "200" e "100" como, respectivamente, a média, o máximo e o mínimo dos valores das compras canceladas por pedido

Scenario: Selecionar período
Given Eu sou o user admin “Acruchi”
And Eu estou na página de administrador 
When  Eu seleciono o período  "MÊS"
And Eu acesso a aba de dados por pedido
Then eu vejo  "150", "200" e "100" como, respectivamente, a média, o máximo e o mínimo dos valores das compras em cada pedidos no mês atual
