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
  end
end
