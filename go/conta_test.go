package main

import "testing"

func TestDepositar(t *testing.T) {
	conta := NovaConta(0)
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
	conta := NovaConta(0)
	valorDeposito := float64(-1)
	err := conta.Depositar(valorDeposito)
	if err != ErrValorInvalidoDeposito {
		t.Errorf("Valor inválido para depósito: %v", err)
	}
}

func TestSacar(t *testing.T) {
	conta := NovaConta(1000)
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
	conta := NovaConta(100)
	err := conta.Sacar(1000)
	if err != ErrValorInvalidoSaque {
		t.Errorf("Valor inválido para saque: %v", err)
	}
	if conta.saldo != 100 {
		t.Errorf("Saldo não deve mudar quando valor for insuficiente")
	}
}
