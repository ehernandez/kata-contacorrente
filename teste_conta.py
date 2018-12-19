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


if __name__ == '__main__':
    unittest.main()