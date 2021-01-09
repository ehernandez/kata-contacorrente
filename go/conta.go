package main

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
func (c *Conta) Depositar(valor float64) {
	c.saldo += valor
}

func main() {

}
