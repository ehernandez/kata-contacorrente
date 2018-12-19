class Conta:

    def __init__(self, id, saldo = 0):
        self.id = id
        self.saldo = saldo

    def deposita(self, valor):
        self.saldo += valor;

    def saca(self, valor):
        if (valor <= self.saldo):
            self.saldo -= valor;

    def transfere(self, destino, valor):
        if (valor <= self.saldo):
            self.saca(valor)
            destino.deposita(valor)