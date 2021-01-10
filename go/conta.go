package main

import "errors"

// ErrValorInvalidoDeposito erro para representar um valor inválido para depósito
var ErrValorInvalidoDeposito = errors.New("valor deve ser maior que zero")

// ErrValorInvalidoSaque error para representar um valor inválido para saque
var ErrValorInvalidoSaque = errors.New("valor de saldo insuficiente para saque")

// Conta estrutura que representa uma conta bancária
type Conta struct {
	saldo float64
}

// NovaConta cria e retorna uma conta
func NovaConta(saldo float64) *Conta {
	return &Conta{
		saldo: saldo,
	}
}

// Depositar acrescenta valor ao saldo existente
func (c *Conta) Depositar(valor float64) error {
	if valor <= 0 {
		return ErrValorInvalidoDeposito
	}
	c.saldo += valor
	return nil
}

// Sacar decrementa valor do saldo existente
func (c *Conta) Sacar(valor float64) error {
	if c.saldo-valor < 0 {
		return ErrValorInvalidoSaque
	}
	c.saldo -= valor
	return nil
}

func main() {

}
