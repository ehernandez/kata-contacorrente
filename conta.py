class Conta:

    def __init__(self, id, saldo = 0, limite = 0):
        self.id = id
        self._saldo = saldo
        self._limite = limite
        self._extrato = []

    def deposita(self, valor):
        self._saldo += valor
        self._extrato.append("Depósito: " + str(valor))

    def saca(self, valor):
        if (valor <= (self._saldo + self._limite)):
            self._saldo -= valor
            self._extrato.append("Saque: " + str(valor))
            return True
        return False

    def transfere(self, destino, valor):
        if (self.saca(valor)) :
            destino.deposita(valor)

    def get_property(self):
        return self._saldo

    def get_extrato(self):
        return self._extrato

    saldo = property(get_property)
    extrato = property(get_extrato)