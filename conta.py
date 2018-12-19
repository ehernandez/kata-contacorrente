class Conta:

    def __init__(self, id):
        self.id = id
        self.saldo = 0

    def deposita(self, valor):
        self.saldo += valor;

    def saca(self, valor):
        self.saldo -= valor;