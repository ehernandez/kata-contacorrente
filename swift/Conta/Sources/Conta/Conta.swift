import Foundation

class Conta {
  private(set) var saldo = 0.0
  private(set) var limite = 0.0
  private var operacoes = [String]()
  
  init(_ saldo: Double = 0.0, _ limite: Double = 0.0) {
    self.saldo = saldo
    self.limite = limite
  }

  func depositar(_ valor: Double) {
    self.saldo = self.saldo + valor
    operacoes.append("Valor depositado: \(valor.localeCurrency)")
  }

  func sacar(_ valorSaque: Double) throws {
    if (self.saldo + self.limite) < valorSaque {
      throw ContaError.SaldoInsuficienteError("Saldo insuficiente para efetuar essa transação.")
    }
    self.saldo = self.saldo - valorSaque
    operacoes.append("Valor sacado: \(valorSaque.localeCurrency)")
  }

  func transferir(_ contaDestino: Conta, _ valor: Double) {
    do {
      try sacar(valor)
      contaDestino.depositar(valor)
    } catch {}
  }

  func extrato() -> String {
    return "\(operacoes.joined(separator: "\n"))\nSaldo: \(self.saldo.localeCurrency)"
  }
}

enum ContaError: Error, Equatable {
  case SaldoInsuficienteError(String)
}

extension Double {
  var localeCurrency: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "pt_BR")
    return formatter.string(from: self as NSNumber)!
  }
}