import Foundation

class Conta {
  private(set) var saldo = 0.0
  private(set) var limite = 0.0

  init(_ saldo: Double = 0.0, _ limite: Double = 0.0) {
    self.saldo = saldo
    self.limite = limite
  }

  func depositar(_ valor: Double) {
    self.saldo = self.saldo + valor
  }

  func sacar(_ valorSaque: Double) throws {
    if (self.saldo + self.limite) < valorSaque {
      throw ContaError.SaldoInsuficienteError("Saldo insuficiente para efetuar essa transação.")
    }
    self.saldo = self.saldo - valorSaque
  }

  func transferir(_ contaDestino: Conta, _ valor: Double) {
    do {
      try sacar(valor)
      contaDestino.depositar(valor)
    } catch {}
  }
}

enum ContaError: Error, Equatable {
  case SaldoInsuficienteError(String)
}