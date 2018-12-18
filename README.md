## Descrição
Esse é um kata planejado para exercitar as práticas de TDD e Pair Programming. Ele foi intencionalmente planejado para começar de maneira bem simples e gradativamente ter mais complexidade adicionada ao desafio e, por consequência, à solução. 

É esperado que no decorrer do exercício as pessoas construam código-fonte de solução e de teste. Todos estão livres para construir novas classes, métodos, funções, atributos, variáveis e testes a medida que isso lhes pareça conveniente. Mesmo tendo alguns exemplos de código-fonte inicial ao final desse documento, esse kata é agnóstico a linguagem de programação. 

## Conteúdo
A ideia desse kata é que cada requisito seja feito pelos passos do TDD: primeiro o teste para ele e então o código-fonte que resolva o desafio. A medida que parecer interessante, pode haver um passo adicional de refatoração. Se o exercício for feito em par, o mecanismo é ter uma troca de pares a cada vez que um dos requisitos for considerado entregue.

### Requisito #1
Crie um método que seja capaz de depositar um valor em conta.


### Requisito #2
Crie um método que seja capaz de sacar o valor de uma conta.


### Requisito #3
Crie um método que tente sacar um valor maior que o saldo de uma conta, mas que não faça a operação.


### Requisito #4
Crie um método que seja capaz de transferir um valor válido de uma conta para outra conta.


### Requisito #5
Crie um método que tente transferir um valor inválido de uma conta para outra conta.


### Requisito #6
Adicione o conceito de limite à conta. Modifique também os métodos de teste, se for preciso.


### Requisito #7
Crie um forma de guardar todas as operações (saque, depósito e transferência) executadas em uma conta.


## Material de Apoio
Abaixo, duas possibilidades para começar a resolução do kata. Uma em Java, outra em Python.

### Exemplos em Java

```
public class Conta {
    int id;
    double saldo;
}
```

Exemplo inicial de Conta em Java (Conta.java)


```
import static org.junit.jupiter.api.Assertions.*;

public class TestaConta {
    
    @Test
    public void testaSaldo() {
        Conta contaTeste = new Conta();
        Assert.assertEquals(0, contaTeste);
    }

}
```

Exemplo inicial de teste de Conta em Java, usando jUnit (TestaConta.java)

### Exemplos em Python
```
    class Conta:

        def __init__(self, id):
            self.id = id
            self.saldo = 0
```

Exemplo inicial de Conta em Python (Conta.py)

```
    import unittest
    from Conta import Conta


    class TesteConta(unittest.TestCase):

        def test_saldo(self):
            c = Conta(1);
            self.assertEqual(0, c.saldo);


    if __name__ == '__main__':
        unittest.main()
```
Exemplo inicial de teste de Conta em Python, usando unittest (TesteConta.py)
