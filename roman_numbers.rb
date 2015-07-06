class Fixnum

  def to_roman

    numbers = { 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X', 14 => 'XIV', 15 => 'XV', 19 => 'XIX', 20 => 'XX', 24 => 'XXIV', 25 => 'XXV' }

    if self.between?( 1, 3 )
      return 'I' * self
    elsif self.between?( 6, 8 )
      return 'V' + ( 'I' * ( self - 5 ) )
    elsif self.between?( 11, 13 )
      return 'X' + ( 'I' * ( self - 10 ) )
    elsif self.between?( 16, 18 )
      return 'X' + 'V' + ( 'I' * ( self - 15 ) )
    elsif self.between?( 21, 23 )
      return 'X' + 'X' + ( 'I' * ( self - 20 ) )
    end

    return numbers[self]
  end

end