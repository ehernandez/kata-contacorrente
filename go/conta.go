package main

import "errors"

// ErrValorInvalidoDeposito erro para representar um valor inválido para depósito
var ErrValorInvalidoDeposito = errors.New("valor deve ser maior que zero")

// ErrValorInvalidoSaque erro para representar um valor inválido para saque
var ErrValorInvalidoSaque = errors.New("valor deve ser maior que zero")

// ErrValorInsuficienteSaque erro para representar um saque com saldo insuficiente
var ErrValorInsuficienteSaque = errors.New("valor de saldo insuficiente")

// Conta estrutura que representa uma conta bancária
type Conta struct {
	saldo float64
}

// NovaConta cria e retorna uma conta
func NovaConta(saldo float64, limite float64) *Conta {
	return &Conta{
		saldo:  saldo,
		limite: limite,
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
	if valor <= 0 {
		return ErrValorInvalidoSaque
	}
	if (c.saldo + c.limite) < valor {
		return ErrValorInsuficienteSaque
	}
	c.saldo -= valor
	return nil
}

// Transferir transfere o valor da conta para outra conta
func (c *Conta) Transferir(valor float64, destino *Conta) error {
	if err := c.Sacar(valor); err != nil {
		return err
	}
	if err := destino.Depositar(valor); err != nil {
		return err
	}
	return nil
}

func main() {

}
