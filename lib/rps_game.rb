# frozen_string_literal: true

class RpsGame
  P1_WINS = 0
  P2_WINS = 1
  DRAW    = 2

  MOVES = %w[rock paper scissors].freeze

  def random_move
    move_index = Kernel.rand(RpsGame::MOVES.length)
    RpsGame::MOVES[move_index]
  end

  def move(p1_move, p2_move)
    case p1_move
    when 'rock'
      case p2_move
      when 'rock'
        return DRAW
      when 'paper'
        return P2_WINS
      when 'scissors'
        return P1_WINS
      end

    when 'paper'
      case p2_move
      when 'rock'
        return P1_WINS
      when 'paper'
        return DRAW
      when 'scissors'
        return P2_WINS
      end

    when 'scissors'
      case p2_move
      when 'rock'
        return P2_WINS
      when 'paper'
        return P1_WINS
      when 'scissors'
        return DRAW
      end
    end
  else
    raise 'invalid move'
  end

  private

  def game_result(p1_move, p2_move = Computer.new)
    return p1_move if RpsGame::P1_WINS
    return p2_move if RpsGame::P2_WINS
    :draw
  end
end
