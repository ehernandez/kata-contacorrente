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
        conta.sacar(10)
        XCTAssertEqual(conta.saldo, 900)
    }
}
