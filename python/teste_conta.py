import unittest
from python.conta import Conta


class TesteConta(unittest.TestCase):

    def test_saldo(self):
        c = Conta(1)
        self.assertEqual(0, c.saldo)

    def test_deposito(self):
        c = Conta(2)
        c.deposita(100)
        self.assertEqual(100, c.saldo)

    def test_multiplos_deposito(self):
        c = Conta(3)
        c.deposita(100)
        c.deposita(100)
        self.assertEqual(200, c.saldo)

    def test_sacar(self):
        c = Conta(4, 100)
        c.saca(55)
        self.assertEqual(45, c.saldo)

    def test_tentar_sacar_valor_insuficiente(self):
        c = Conta(5, 100)
        c.saca(200)
        self.assertEqual(100, c.saldo)

    def test_transferencia(self):
        c1 = Conta(6, 1000)
        c2 = Conta(7, 0)
        c1.transfere(c2, 100)
        self.assertEqual(900, c1.saldo)
        self.assertEqual(100, c2.saldo)

    def test_transferencia_invalida(self):
        c1 = Conta(8, 100)
        c2 = Conta(9, 0)
        c1.transfere(c2, 200)
        self.assertEqual(100, c1.saldo)
        self.assertEqual(0, c2.saldo)

    def test_tranferencia_usando_limite(self):
        c1 = Conta(10, 100, 1000)
        c2 = Conta(11)
        c1.transfere(c2, 200)
        self.assertEqual(-100, c1.saldo)
        self.assertEqual(200, c2.saldo)

    def test_log_operacoes(self):
        c1 = Conta(12, 100, 1000)
        c1.deposita(100)
        c1.saca(100)

        c2 = Conta(13, 100, 1000)
        c1.transfere(c2, 50)

        self.assertEqual(3, len(c1.extrato))
        self.assertEqual(1, len(c2.extrato))


if __name__ == '__main__':
    unittest.main()