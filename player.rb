class Game

  attr_reader :points, :rebounds

  def initialize
    super
    @team = []
    @points, @rebounds = 0, 0
  end

  def team
    seperate
    @team.each do |player|
      puts "\n#{player.number}: #{player.name}\n"
    end  
    seperate
  end

  def add_player(name, num)
    #Create Player#object and push to @team array
    @player = Player.new(name, num).tap{|player| @team.push(player)}  
  end

  def add_to_team(player)
    @team.push(player)
  end

  def update_points
    sum = 0
    @team.each{|player| sum += player.points}
    return sum
  end

  def points
    @points = update_points()
  end

  def update_rebounds
    sum = 0
    @team.each{|player| sum += (player.offRebs + player.defRebs)}
    return sum
  end

  def rebounds
    @rebounds = update_rebounds()
  end

  def seperate
    puts "----------------------------------"
  end

  def display
    puts "\n\n"
    seperate
    @team.each do |player|
      puts "#{player.number}: #{player.name}"
    end
    seperate
    puts "\n\n"
  end

  def prompt
    print "\n>>> "
  end

  def exit
    puts "Are you sure? (Y/N)"
    prompt()
    action = gets.chomp()
    if action.upcase == 'Y'
      Process.exit(1)
    end
  end

  def inspect
    puts "-----"
  end

=begin
  def game_details
    loop do
      puts "\nAdd a Player to the Roster? (Y/N)"
      prompt
      action = gets.chomp
      if action.upcase == 'Y'
        puts "Player Name:"
        prompt
        name = gets.chomp
        puts "Player Number:"
        prompt
        number = gets.chomp
        # Store details in a new Player#object
        # How do I access this object from the command line??
        add_player(name, number)
      elsif action.upcase == 'N'
        return
      else
        puts "Try that again."
      end
    end
  end
=end
end


class Player
  
  attr_accessor :name, :age, :height, :weight, :position, :number, :points, :offRebs, :defRebs

  def initialize(name=nil, numb=nil)
    @name, @age, @height, @weight, @position, @number = name, 0, 0, 0, nil, numb
    #shot variables initialized
    @points, @ftAttempted, @ftMade, @twoAttempted, 
        @twoMade, @threeAttempted, @threeMade = 0,0,0,0,0,0,0,0,0
    #rebound variables
    @offRebs, @defRebs = 0,0
    #assist variable
    @assists = 0
    #turnover variable
    @turnovers = 0
    #block variable
    @blocks = 0
  end

  def block
    @blocks += 1
  end

  def turn
    @turnovers += 1
  end

  def asst
    @assists += 1
  end

  def oreb
    @offRebs += 1
  end

  def dreb
    @defRebs += 1
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
    puts "Total Blocks:           #{@blocks}"
    puts "\n"
  end

  def turn_info
    puts "TURNOVER STATISTICS"
    puts "----------------------------"
    puts "Turnovers:              #{@turnovers}"
    puts "\n"
  end

  def asst_info
    asst_turn = percent(@assists, @turnovers)
    puts "ASSIST STATISTICS"
    puts "----------------------------"
    puts "Total Assists:          #{@assists}"
    puts "Assist/Turnover:        #{asst_turn}"
    puts "\n"
  end

  def reb_info
    tot_rebs = @defRebs + @offRebs
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
    puts "\nSHOOTING STATISTICS"
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
    puts "Number:                #{@number}"
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

  def inspect
    puts "-----"
  end

end  #<-- END Player Class -->

