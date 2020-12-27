# frozen_string_literal: true

class Conta
  attr_reader :saldo, :limite

  def initialize(saldo: 0, limite: nil)
    @saldo = saldo
    @limite = limite
  end

  def depositar(valor)
    @saldo += valor
  end
end
