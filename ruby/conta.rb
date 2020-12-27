# frozen_string_literal: true

class Conta
  class SaldoInsuficienteError < StandardError; end

  attr_reader :saldo, :limite, :operacoes, :id

  def initialize(saldo: 0, limite: 0)
    @saldo = saldo
    @limite = limite
    @operacoes = []
  end

  def depositar(valor)
    @saldo += valor
    @operacoes << format('Valor depositado: %.2f', valor)
  end

  def sacar(valor)
    check_limite!(valor_saque: valor)
    @operacoes << format('Valor sacado: %.2f', valor)

    @saldo -= valor
  end

  def transferir(conta_destino:, valor:)
    sacar(valor)
    conta_destino.depositar(valor)
  end

  def extrato
    operacoes + [format('Saldo: %.2f', saldo)]
  end

  private

  def check_limite!(valor_saque:)
    raise SaldoInsuficienteError if (saldo + limite) < valor_saque
  end
end
