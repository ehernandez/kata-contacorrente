class Conta:

    def __init__(self, id, saldo = 0, limite = 0):
        self._id = id
        self._saldo = saldo
        self._limite = limite
        self._extrato = []

    def deposita(self, valor):
        self._saldo += valor
        self._extrato.append("Depósito: {}".format(valor))

    def saca(self, valor):
        if (valor <= (self._saldo + self._limite)):
            self._saldo -= valor
            self._extrato.append("Saque: {}".format(valor))
            return True
        return False

    def transfere(self, destino, valor):
        if (self.saca(valor)) :
            destino.deposita(valor)

    @property
    def saldo(self):
        return self._saldo

    @property
    def extrato(self):
        return self._extrato
