import XCTest
@testable import Conta

final class ContaTests: XCTestCase {
    func testSaldo() {
        let conta = Conta(10)
        XCTAssertEqual(conta.saldo, 10)
    }
}
