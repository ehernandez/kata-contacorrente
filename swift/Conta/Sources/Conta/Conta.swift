import Foundation

class Conta {
  private(set) var saldo = 0.0

  init(_ saldo: Double = 0.0) {
    self.saldo = saldo
  }

  func depositar(_ valor: Double) {
    saldo = saldo + valor
  }

  func sacar(_ valorSaque: Double) throws {
    guard saldo < valorSaque else {
      throw ContaError.SaldoInsuficienteError("Saldo insuficiente para efetuar essa transação.")
    }
    saldo = saldo - valorSaque
  }

  func transferir(_ contaDestino: Conta, _ valor: Double) {
      try? sacar(valor)
      contaDestino.depositar(valor)
  }
}

enum ContaError: Error, Equatable {
  case SaldoInsuficienteError(String)
}