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
        try? conta.sacar(100)
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

    func testTransferenciaValorInsuficiente() {
        let contaOrigem = Conta(100)
        let contaDestino = Conta(200)
        contaOrigem.transferir(contaDestino, 1000)
        XCTAssertEqual(contaOrigem.saldo, 100)
        XCTAssertEqual(contaDestino.saldo, 200)
    }

    func testLimiteDeCredito() {
        let conta = Conta(100, 100)
        try? conta.sacar(150)
        XCTAssertEqual(conta.saldo, -50)
    }

    func testExtrato() {
        let conta = Conta(0)
        conta.depositar(1000)
        try? conta.sacar(100)
        XCTAssertEqual(
            conta.extrato().count,
            "Valor depositado: R$ 1.000,00\nValor sacado: R$ 100,00\nSaldo: R$ 900,00".count
        )
    }
}
