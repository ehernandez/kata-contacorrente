package main

import "testing"

func TestDepositar(t *testing.T) {
	conta := NovaConta(0)
	valorDeposito := float64(100)
	conta.Depositar(valorDeposito)
	if conta.saldo != 100 {
		t.Errorf("Após depósito, saldo deveria ser %f, porém está %f", valorDeposito, conta.saldo)
	}
}
