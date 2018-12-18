import unittest
from Conta import Conta


class TesteConta(unittest.TestCase):

    def test_saldo(self):
        c = Conta(1);
        self.assertEqual(0, c.saldo);


if __name__ == '__main__':
    unittest.main()