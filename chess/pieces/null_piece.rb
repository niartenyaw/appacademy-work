require 'singleton'

class NullPiece < Piece

  include Singleton

  def initialize; end

  def team
    :blank
  end

  def symbol
    "-"
  end
end
