# Crie um método que seja capaz de depositar um valor em conta

## User Story

~~~
Como um cliente do banco ACME
Eu desejo depositar um valor em outra conta
Para que eu possa pagar o dinheiro que peguei emprestado de um amigo
~~~

## Critérios de Aceite

### Depósito de valor em outra conta

~~~
Dado que eu tenha R$ 200 na minha conta
  E a conta 0001-1 possua R$ 0
Quando eu transferir R$ 100 para a conta 0001-1
Então eu terei R$ 100
  E a conta 0001-1 100`
~~~
