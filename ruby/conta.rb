# frozen_string_literal: true

class Conta
  class SaldoInsuficienteError < StandardError; end

  attr_reader :saldo, :limite

  def initialize(saldo: 0, limite: nil)
    @saldo = saldo
    @limite = limite
  end

  def depositar(valor)
    @saldo += valor
  end

  def sacar(valor)
    raise SaldoInsuficienteError if (saldo - valor).negative?

    @saldo -= valor
  end

  def transferir(conta_destino:, valor:)
    sacar(valor)
    conta_destino.depositar(valor)
  end
end
