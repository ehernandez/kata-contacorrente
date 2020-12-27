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
end
