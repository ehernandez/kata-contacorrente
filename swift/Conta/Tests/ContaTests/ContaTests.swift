import XCTest
@testable import Conta

final class ContaTests: XCTestCase {
    func testSaldo() {
        let conta = Conta(10)
        XCTAssertEqual(conta.saldo, 10)
    }

    func testDeposito() {
        let conta = Conta()
        conta.depositar(100)
        XCTAssertEqual(conta.saldo, 100)
    }

    func testSacar() {
        let conta = Conta(1000)
        try? conta.sacar(10)
        XCTAssertEqual(conta.saldo, 900)
    }

    func testTentarSacarValorInsuficiente() {
        let conta = Conta(100)
        XCTAssertThrowsError(try conta.sacar(1000))
        XCTAssertEqual(conta.saldo, 100)
    }

    func testTransferencia() {
        let contaOrigem = Conta(1000)
        let contaDestino = Conta(100)
        contaOrigem.transferir(contaDestino, 300)
        XCTAssertEqual(contaOrigem.saldo, 700)
        XCTAssertEqual(contaDestino.saldo, 400)
    }
}
