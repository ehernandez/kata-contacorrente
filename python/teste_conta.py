import unittest
from python.conta import Conta


class TesteConta(unittest.TestCase):

    def test_saldo(self):
        conta = Conta(1)
        self.assertEqual(0, conta.saldo)

    def test_deposito(self):
        conta = Conta(2)
        conta.deposita(100)
        self.assertEqual(100, conta.saldo)

    def test_multiplos_deposito(self):
        conta = Conta(3)
        conta.deposita(100)
        conta.deposita(100)
        self.assertEqual(200, conta.saldo)

    def test_sacar(self):
        conta = Conta(4, 100)
        conta.saca(55)
        self.assertEqual(45, conta.saldo)

    def test_tentar_sacar_valor_insuficiente(self):
        conta = Conta(5, 100)
        conta.saca(200)
        self.assertEqual(100, conta.saldo)

    def test_transferencia(self):
        conta_origem = Conta(6, 1000)
        conta_destino = Conta(7, 0)
        conta_origem.transfere(conta_destino, 100)
        self.assertEqual(900, conta_origem.saldo)
        self.assertEqual(100, conta_destino.saldo)

    def test_transferencia_invalida(self):
        conta_origem = Conta(8, 100)
        conta_destino = Conta(9, 0)
        conta_origem.transfere(conta_destino, 200)
        self.assertEqual(100, conta_origem.saldo)
        self.assertEqual(0, conta_destino.saldo)

    def test_tranferencia_usando_limite(self):
        conta_origem = Conta(10, 100, 1000)
        conta_destino = Conta(11)
        conta_origem.transfere(conta_destino, 200)
        self.assertEqual(-100, conta_origem.saldo)
        self.assertEqual(200, conta_destino.saldo)

    def test_log_operacoes(self):
        conta_origem = Conta(12, 100, 1000)
        conta_origem.deposita(100)
        conta_origem.saca(100)

        conta_destino = Conta(13, 100, 1000)
        conta_origem.transfere(conta_destino, 50)

        self.assertEqual(3, len(conta_origem.extrato))
        self.assertEqual(1, len(conta_destino.extrato))


if __name__ == '__main__':
    unittest.main()