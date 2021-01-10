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
	conta.Sacar(100.0)
	if conta.saldo != saldoEsperado {
		t.Errorf("Saldo restante deveria ser %f mas tem %f", saldoEsperado, conta.saldo)
	}
}
