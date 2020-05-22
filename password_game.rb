class PasswordGame
  TRIES = 10
  PIECES = 7

  attr_accessor :password, :plays

  def initialize *password
    self.password = password
    self.plays = []
  end

  def play! *password
    status = check_play password

    self.plays << {
      status: status,
      play: password
    }

    plays
  end

  def win?
    password == plays.last[:play]
  end

  def finished?
    plays.length >= TRIES || win?
  end

  private

  def check_play password
    status = []

    self.password.each_with_index do |piece, i|
      next status << :black if password[i] == piece
      status << :white if piece.in? password
    end

    status
  end

end
