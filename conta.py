class Conta:

    def __init__(self, id, saldo = 0, limite = 0):
        self.id = id
        self.saldo = saldo
        self.limite = limite

    def deposita(self, valor):
        self.saldo += valor

    def saca(self, valor):
        if (valor <= (self.saldo + self.limite)):
            self.saldo -= valor
            return True
        return False

    def transfere(self, destino, valor):
        if (self.saca(valor)) :
            destino.deposita(valor)