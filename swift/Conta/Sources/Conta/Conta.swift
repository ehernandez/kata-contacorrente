import Foundation

class Conta {
  private(set) var saldo = 0.0

  init(_ saldo: Double = 0.0) {
    self.saldo = saldo
  }

  func depositar(_ valor: Double) {
    saldo = saldo + valor
  }
}