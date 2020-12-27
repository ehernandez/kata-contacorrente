# frozen_string_literal: true

require 'rspec'
require_relative 'conta'

RSpec.describe Conta do
  describe 'Depositando um valor' do
    it 'deve incrementar o saldo' do
      subject.depositar(100.5)
      expect(subject.saldo).to eq(100.5)
    end
  end

  describe 'Sacando um valor' do
    context 'quando tiver saldo' do
      subject { described_class.new(saldo: 99.5) }

      it 'deve decrementar o saldo' do
        subject.sacar(0.5)
        expect(subject.saldo).to eq(99)
      end
    end

    context 'quando não tiver saldo suficiente' do
      subject { described_class.new(saldo: 20) }

      it 'deve gerar exception' do
        expect { subject.sacar(21) }.to raise_error(described_class::SaldoInsuficienteError)
      end

      it 'não deve alterar o saldo' do
        begin
          subject.sacar(21)
        rescue described_class::SaldoInsuficienteError
          nil
        end

        expect(subject.saldo).to eq(20)
      end
    end
  end
end
