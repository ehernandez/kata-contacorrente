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
      subject { described_class.new(saldo: 20, limite: 50) }

      context 'e tiver limite' do
        it 'deve decrementar o saldo' do
          subject.sacar(40)

          expect(subject.saldo).to eq(-20)
        end
      end

      context 'e não tiver limite' do
        it 'não deve alterar o saldo' do
          expect { subject.sacar(100) }.to raise_error(described_class::SaldoInsuficienteError)

          expect(subject.saldo).to eq(20)
        end
      end
    end
  end

  describe 'Transferindo valor entre contas' do
    let(:conta_origem) { described_class.new(saldo: 100) }
    let(:conta_destino) { described_class.new(saldo: 1) }

    context 'quando tiver saldo' do
      it 'deve transferir valor' do
        conta_origem.transferir(conta_destino: conta_destino, valor: 50)

        expect(conta_origem.saldo).to eq(50)
        expect(conta_destino.saldo).to eq(51)
      end
    end

    context 'quando não tiver saldo' do
      it 'não deve transferir valor' do
        expect { conta_origem.transferir(conta_destino: conta_destino, valor: 200) }
          .to raise_error(described_class::SaldoInsuficienteError)

        expect(conta_origem.saldo).to eq(100)
        expect(conta_destino.saldo).to eq(1)
      end
    end
  end
end
