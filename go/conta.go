package main

import (
	"errors"
	"fmt"
)

// ErrValorInvalidoDeposito erro para representar um valor inválido para depósito
var ErrValorInvalidoDeposito = errors.New("valor deve ser maior que zero")

// ErrValorInvalidoSaque erro para representar um valor inválido para saque
var ErrValorInvalidoSaque = errors.New("valor deve ser maior que zero")

// ErrValorInsuficienteSaque erro para representar um saque com saldo insuficiente
var ErrValorInsuficienteSaque = errors.New("valor de saldo insuficiente")

// Conta estrutura que representa uma conta bancária
type Conta struct {
	saldo     float64
	limite    float64
	operacoes []string
}

// NovaConta cria e retorna uma conta
func NovaConta(saldo float64, limite float64) *Conta {
	return &Conta{
		saldo:     saldo,
		limite:    limite,
		operacoes: make([]string, 0),
	}
}

// Depositar acrescenta valor ao saldo existente
func (c *Conta) Depositar(valor float64) error {
	if valor <= 0 {
		return ErrValorInvalidoDeposito
	}
	c.saldo += valor
	c.registraOperacao(fmt.Sprintf("Depósito: R$ %.2f", valor))
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
	c.registraOperacao(fmt.Sprintf("Saque: R$ %.2f", valor))
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
	c.registraOperacao(fmt.Sprintf("Transferência: R$ %.2f", valor))
	return nil
}

// GerarExtrato gera um extra com todas as operações executadas na conta
// representadas com um identificador e um valor
func (c *Conta) GerarExtrato() []string {
	operacoes := append(c.operacoes, fmt.Sprintf("Saldo: R$ %.2f", c.saldo))
	return operacoes
}

func (c *Conta) registraOperacao(identificacao string) {
	c.operacoes = append(c.operacoes, identificacao)
}

func main() {

}
