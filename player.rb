class Game

  #NEED HELP HERE
  #How do I make it so when I add points to a player object (ie player#twomake)
  #it also adds points to the Game @@points total
  @@points = 0

  def initialize
    super
    @team = []
  end

  def add_player
    @player = Player.new
  end

  def add_to_team(player)
    @team.push(player)
  end

  def display
    puts "\n\n"
    puts "----------------------------------"
    @team.each do |player|
      puts "#{player.number}: #{player.name}"
    end
    puts "----------------------------------"
    puts "\n\n"
  end
end

class Player
  
  attr_accessor :name, :age, :height, :weight, :position, :number, :points, :ftAttempted, :ftMade, 
          :twoAttempted, :twoMade, :threeAttempted, :threeMade, :defReb, :offReb,
          :assist, :turnover, :block

  def initialize()
    @name, @age, @height, @weight, @position, @number = nil, 0, 0, 0, nil, 0
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
