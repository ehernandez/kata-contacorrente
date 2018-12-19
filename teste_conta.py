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


if __name__ == '__main__':
    unittest.main()