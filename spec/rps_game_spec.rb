# frozen_string_literal: true

require 'rps_game'

describe RpsGame do
  subject(:game) { described_class.new }

  #
  # rule engine tests
  #

  # rock
  it 'rock beats scissors' do
    expect(game.move('rock', 'scissors')).to eq RpsGame::P1_WINS
  end

  it 'rock beaten by paper' do
    expect(game.move('rock', 'paper')).to eq RpsGame::P2_WINS
  end

  # paper
  it 'paper beats rock' do
    expect(game.move('paper', 'rock')).to eq RpsGame::P1_WINS
  end

  it 'paper beaten by scissors' do
    expect(game.move('paper', 'scissors')).to eq RpsGame::P2_WINS
  end

  # scissors
  it 'scissors beats paper' do
    expect(game.move('scissors', 'paper')).to eq RpsGame::P1_WINS
  end

  it 'scissors beaten by rock' do
    expect(game.move('scissors', 'rock')).to eq RpsGame::P2_WINS
  end

  # same move --> draw
  it 'draw' do
    %w[rock paper scissors].each do |m|
      expect(game.move(m, m)).to eq RpsGame::DRAW
    end
  end

  # wrong value(s)
  it 'supplied wrong move' do
    expect { game.move('foobar', 'rock') }.to raise_error('invalid move')
    expect { game.move('paper', 'inalid') }.to raise_error('invalid move')
    expect { game.move('foobar', 'invalid') }.to raise_error('invalid move')
  end

  #
  # Random move generator test
  #
  moves = %w[rock paper scissors]
  it 'generates a random move' do
    expect(moves).to include(game.random_move)
  end
end
