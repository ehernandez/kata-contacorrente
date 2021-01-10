package main

import (
	"testing"
)

func TestDepositar(t *testing.T) {
	conta := NovaConta(0, 0)
	valorDeposito := float64(100)
	err := conta.Depositar(valorDeposito)
	// Sempre verificamos se algum erro aconteceu, mesmo que isso pareça óbvio pelo teste
	if err != nil {
		t.Errorf("Erro ao depositar valor: %v", err)
	}
	if conta.saldo != 100 {
		t.Errorf("Após depósito, saldo deveria ser %f, porém está %f", valorDeposito, conta.saldo)
	}
}

func TestDepositarValorInvalido(t *testing.T) {
	conta := NovaConta(0, 0)
	valorDeposito := float64(-1)
	err := conta.Depositar(valorDeposito)
	if err != ErrValorInvalidoDeposito {
		t.Errorf("Valor inválido para depósito: %v", err)
	}
}

func TestSacar(t *testing.T) {
	conta := NovaConta(1000, 0)
	saldoEsperado := 900.00
	err := conta.Sacar(100)
	if err != nil {
		t.Errorf("Erro ao sacar valor: %v", err)
	}
	if conta.saldo != saldoEsperado {
		t.Errorf("Saldo restante deveria ser %f mas tem %f", saldoEsperado, conta.saldo)
	}
}

func TestSacarValorInsuficiente(t *testing.T) {
	conta := NovaConta(100, 0)
	err := conta.Sacar(1000)
	if err != ErrValorInvalidoSaque {
		t.Errorf("Valor inválido para saque: %v", err)
	}
	if conta.saldo != 100 {
		t.Errorf("Saldo não deve mudar quando valor for insuficiente")
	}
}

func TestTransferirValor(t *testing.T) {
	contaOrigem := NovaConta(1000, 0)
	contaDestino := NovaConta(100, 0)
	contaOrigem.Transferir(300, contaDestino)

	if contaOrigem.saldo != 700 {
		t.Errorf("Após transferir 300 reais, a conta origem deveria ter 700 de saldo. Saldo: %f", contaOrigem.saldo)
	}

	if contaDestino.saldo != 400 {
		t.Error("Após receber 300 reais via transferência, a conta destino deveria ter 400")
	}
}

func TestTransferirValorInvalido(t *testing.T) {
	contaOrigem := NovaConta(100, 0)
	contaDestino := NovaConta(200, 0)
	err := contaOrigem.Transferir(1000, contaDestino)

	if err != nil && contaOrigem.saldo != 100 {
		t.Errorf("Após transferir 1000 reais, a conta origem deveria ter 100 de saldo. Erro: %v", err)
	}

	if err != nil && contaDestino.saldo != 200 {
		t.Errorf("Falhada a transferência, a conta destino deve permanecer com o mesmo saldo. Erro: %v", err)
	}
}

func TestSacarValorComLimite(t *testing.T) {
	conta := NovaConta(100, 100)
	saldoEsperado := -50.00
	err := conta.Sacar(150)
	if err != nil {
		t.Errorf("Erro ao sacar valor: %v", err)
	}
	if conta.saldo != saldoEsperado {
		t.Errorf("Saldo restante deveria ser %f mas tem %f", saldoEsperado, conta.saldo)
	}
}
