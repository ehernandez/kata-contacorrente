class Conta:

    def __init__(self, id, saldo = 0, limite = 0):
        self.id = id
        self.saldo = saldo
        self.limite = limite
        self.extrato = []

    def deposita(self, valor):
        self.saldo += valor
        self.extrato.append("Depósito: " + str(valor))

    def saca(self, valor):
        if (valor <= (self.saldo + self.limite)):
            self.saldo -= valor
            self.extrato.append("Saque: " + str(valor))
            return True
        return False

    def transfere(self, destino, valor):
        if (self.saca(valor)) :
            destino.deposita(valor)