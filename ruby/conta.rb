# frozen_string_literal: true

class Conta
  class SaldoInsuficienteError < StandardError; end

  attr_reader :saldo, :limite

  def initialize(saldo: 0, limite: 0)
    @saldo = saldo
    @limite = limite
  end

  def depositar(valor)
    @saldo += valor
  end

  def sacar(valor)
    check_limite!(valor_saque: valor)

    @saldo -= valor
  end

  def transferir(conta_destino:, valor:)
    sacar(valor)
    conta_destino.depositar(valor)
  end

  private

  def check_limite!(valor_saque:)
    raise SaldoInsuficienteError if (saldo + limite) < valor_saque
  end
end
