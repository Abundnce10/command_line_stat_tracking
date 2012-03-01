
class Player
  
  attr_accessor :name, :age, :height, :weight, :position, :points, :ftAttempted, :ftMade, 
          :twoAttempted, :twoMade, :threeAttempted, :threeMade, :defReb, :offReb,
          :assist, :turnover, :block

  def initialize()
    @name, @age, @height, @weight, @position = nil, 0, 0, 0, nil
    #shot variables initialized
    @points, @ftAttempted, @ftMade, @twoAttempted, 
        @twoMade, @threeAttempted, @threeMade = 0,0,0,0,0,0,0,0,0
    #rebound variables
    @offReb, @defReb = 0,0
    #assist variable
    @assist = 0
    #turnover variable
    @turnover = 0
    #block variable
    @block = 0
  end

  def block
    @block += 1
  end

  def turn
    @turnover += 1
  end

  def asst
    @assist += 1
  end

  def oreb
    @offReb += 1
  end

  def dreb
    @defReb += 1
  end

  def ftmake
    @ftAttempted += 1
    @ftMade += 1
    @points += 1
  end

  def ftmiss
    @ftAttempted += 1
  end

  def twomake
    @twoAttempted += 1
    @twoMade += 1
    @points += 2
  end

  def twomiss
    @twoAttempted += 1
  end

  def threemake
    @threeAttempted += 1
    @threeMade += 1
    @points += 3
  end

  def threemiss
    @threeAttempted += 1
  end

  def percent(make, att)
    return (make.to_f / att).round(2)
  end

  def block_info
    puts "BLOCK STATISTICS"
    puts "----------------------------"
    puts "Total Blocks:           #{@block}"
    puts "\n"
  end

  def turn_info
    puts "TURNOVER STATISTICS"
    puts "----------------------------"
    puts "Turnovers:              #{@turnover}"
    puts "\n"
  end

  def asst_info
    asst_turn = percent(@assist, @turnover)
    puts "ASSIST STATISTICS"
    puts "----------------------------"
    puts "Total Assists:          #{@assist}"
    puts "Assist/Turnover:        #{asst_turn}"
    puts "\n"
  end

  def reb_info
    tot_rebs = @defReb + @offReb
    puts "REBOUND STATISTICS"
    puts "----------------------------"
    puts "Offensive Rebs:         #{@offReb}"
    puts "Defensive Rebs:         #{@defReb}"
    puts "Total Rebs:             #{tot_rebs}"
    puts "\n"
  end

  def shot_info 
    fg_made = @twoMade + @threeMade
    fg_att =  @twoAttempted + @threeAttempted
    ft_perct = percent(@ftMade, @ftAttempted)
    two_perct = percent(@twoMade, @twoAttempted)
    three_perct = percent(@threeMade, @threeAttempted)
    fg_perct = percent(fg_made, fg_att)
    puts "SHOOTING STATISTICS"
    puts "----------------------------"
    puts "Points:                 #{@points}"
    puts "----------------------------"
    puts "FTMade:                 #{@ftMade}"
    puts "FTAttempted:            #{@ftAttempted}"
    puts "FT%:                    #{ft_perct}"
    puts "----------------------------"
    puts "2PMade:                 #{@twoMade}"
    puts "2PAttempted:            #{@twoAttempted}"
    puts "2P%:                    #{two_perct}"
    puts "----------------------------"
    puts "3PMade:                 #{@threeMade}"
    puts "3PAttempted:            #{@threeAttempted}"
    puts "3P%:                    #{three_perct}"
    puts "----------------------------"
    puts "FGMade:                 #{fg_made}"
    puts "FGAttempted:            #{fg_att}"
    puts "FG%:                    #{fg_perct}" 
    puts "\n"
  end

  def player_info
    puts "\n\n\n"
    puts "PLAYER INFO"
    puts "----------------------------"
    puts "Name:                  #{@name}"
    puts "Age:                   #{@age} years old"
    puts "Height:                #{@height} inches"
    puts "Weight:                #{@weight} pounds"
    puts "Position:              #{@position}"
    puts "\n" 
  end

  def display
    player_info
    shot_info
    reb_info
    asst_info
    turn_info
    block_info
    puts "\n\n"
  end

end  #<-- END Player Class -->



def foo; puts "foo"; end; def bar; foo; end; bar # prints "foo"




