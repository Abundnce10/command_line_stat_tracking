class Game

  attr_reader :points, :rebounds, :assists, :steals, :blocks, :turnovers, :teamname,
              :twoAtts, :twoMades, :threeAtts, :threeMades, :ftAtts, :ftMades,
              :offRebs, :defRebs

  def initialize(teamname=nil)
    super
    @teamname = teamname
    @team = []
    @points, @rebounds, @assists, @steals, @blocks, @turnovers,
        @twoAtts, @twoMades, @threeAtts, @threeMades, @ftAtts,
        @ftMades, @offRebs, @defRebs  = 0,0,0,0,0,0,0,0,0,0,0,0,0
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

  def update_assists
    sum = 0
    @team.each{|player| sum += player.assists}
    return sum
  end

  def assists
    @assists = update_assists
  end

  def update_steals
    sum = 0
    @team.each{|player| sum += player.steals}
    return sum
  end

  def steals
    @steals = update_steals
  end

  def update_blocks
    sum = 0
    @team.each{|player| sum += player.blocks}
    return sum
  end

  def blocks
    @blocks = update_blocks
  end

  def update_turnovers
    sum = 0
    @team.each{|player| sum += player.turnovers}
    return sum
  end

  def turnovers
    @turnovers = update_turnovers
  end

  def update_twoAtts
    sum = 0
    @team.each{|player| sum += player.twoAtt}
    return sum
  end

  def twoAtts
    @twoAtts = update_twoAtts
  end

  def update_twoMades
    sum = 0
    @team.each{|player| sum += player.twoMade}
    return sum
  end

  def twoMades
    @twoMades = update_twoMades
  end

  def update_threeAtts
    sum = 0
    @team.each{|player| sum += player.threeAtt}
    return sum
  end

  def threeAtts
    @threeAtts = update_threeAtts
  end

  def update_threeMades
    sum = 0
    @team.each{|player| sum += player.threeMade}
    return sum
  end

  def threeMades
    @threeMades = update_threeMades
  end


  def update_ftAtts
    sum = 0
    @team.each{|player| sum += player.ftAtt}
    return sum
  end

  def ftAtts
    @ftAtts = update_ftAtts
  end

  def update_ftMades
    sum = 0
    @team.each{|player| sum += player.ftMade}
    return sum
  end

  def ftMades
    @ftMades = update_ftMades
  end

  def update_offRebs
    sum = 0
    @team.each{|player| sum += player.offRebs}
    return sum
  end

  def offRebs
    @offRebs = update_offRebs
  end

  def update_defRebs
    sum = 0
    @team.each{|player| sum += player.defRebs}
    return sum
  end

  def defRebs
    @defRebs = update_defRebs
  end

  def rebounds
    @rebounds = update_offRebs + update_defRebs
  end



  def update
    points
    rebounds
    assists
    steals
    blocks
    turnovers
    twoAtts
    twoMades
    threeAtts
    threeMades
    ftAtts
    ftMades
    defRebs
    offRebs
    rebounds
  end

  def roster
    puts "\n\n\t\t#{@teamname}"
    dashes
    @team.each do |player|
      puts "\n\t\t#{player.number}: #{player.name}\n"
    end  
    puts "\n"
    dashes
    puts "\n"
  end


  def display
    #update game instance variables
    update
    puts "\n\n\t\t#{@teamname}"
    dashes
    puts "\n\t\tSCORE:                 #{@points}"
    dashes 
    puts "\n\t\tSHOOTING"
    puts "\n\t\tTwo Pointers:          #{@twoMades} / #{@twoAtts}"
    puts "\t\tThree Pointers:        #{@threeMades} / #{@threeAtts}"
    puts "\t\tFree Throws:           #{@ftMades} / #{@ftAtts}"
    dashes
    puts "\n\t\tREBOUNDING"
    puts "\n\t\tOffensive              #{@offRebs}"
    puts "\t\tDefensive:             #{@defRebs}"
    dashes
    puts "\n\t\tASSISTS:               #{@assists}"
    dashes
    puts "\n\t\tSTEALS:                #{@steals}"
    dashes
    puts "\n\t\tBLOCKS:                #{@blocks}"
    dashes
    puts "\n\t\tTURNOVERS:             #{@turnovers}"
    dashes
    puts "\n\n"
  end

  def shot_info
    update
    puts "\n\n\t\tSHOOTING"
    dashes 
    puts "\n\t\tTWO POINTERS:          #{@twoMades} / #{@twoAtts}"
    puts "\t\tTHREE POINTERS:        #{@threeMades} / #{@threeAtts}"
    puts "\t\tFREE THROWS:           #{@ftMades} / #{@ftAtts}"
    dashes
    puts "\n\t\tSCORE:                 #{@points}"
    puts "\n\n"
  end


  def dashes
    puts "\n\t\t------------------------------------"
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

end


class Player
  
  attr_accessor :name, :age, :height, :weight, :position, :number, :points, 
                :offRebs, :defRebs, :assists, :turnovers, :blocks, :steals,
                :ftAtt, :ftMade, :twoAtt, :twoMade, :threeAtt, :threeMade

  def initialize(name=nil, numb=nil)
    @name, @age, @height, @weight, @position, @number = name, 0, 0, 0, nil, numb
    #shot variables initialized
    @points, @ftAtt, @ftMade, @twoAtt, 
        @twoMade, @threeAtt, @threeMade = 0,0,0,0,0,0,0,0,0
    #rebound variables
    @offRebs, @defRebs = 0,0
    #assist variable
    @assists = 0
    #turnover variable
    @turnovers = 0
    #block variable
    @blocks = 0
    #steal variable
    @steals = 0
  end

  def steal
    @steals += 1
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
    @ftAtt += 1
    @ftMade += 1
    @points += 1
  end

  def ftmiss
    @ftAtt += 1
  end

  def twomake
    @twoAtt += 1
    @twoMade += 1
    @points += 2
  end

  def twomiss
    @twoAtt += 1
  end

  def threemake
    @threeAtt += 1
    @threeMade += 1
    @points += 3
  end

  def threemiss
    @threeAtt += 1
  end

  def percent(make, att)
    return (make.to_f / att).round(2)
  end

  def steal_info
    puts "\n\t\tSTEAL STATISTICS"
    dashes
    puts "\t\tTotal Steals:           #{@steals}"
    puts "\n"
  end

  def block_info
    puts "\n\t\tBLOCK STATISTICS"
    dashes
    puts "\t\tTotal Blocks:           #{@blocks}"
    puts "\n"
  end

  def turn_info
    puts "\n\t\tTURNOVER STATISTICS"
    dashes
    puts "\t\tTurnovers:              #{@turnovers}"
    puts "\n"
  end

  def asst_info
    asst_turn = percent(@assists, @turnovers)
    puts "\n\t\tASSIST STATISTICS"
    dashes
    puts "\t\tTotal Assists:          #{@assists}"
    puts "\t\tAssist/Turnover:        #{asst_turn}"
    puts "\n"
  end

  def reb_info
    tot_rebs = @defRebs + @offRebs
    puts "\n\t\tREBOUND STATISTICS"
    dashes
    puts "\t\tOffensive Rebs:         #{@offRebs}"
    puts "\t\tDefensive Rebs:         #{@defRebs}"
    puts "\t\tTotal Rebs:             #{tot_rebs}"
    puts "\n"
  end

  def shot_info 
    fg_made = @twoMade + @threeMade
    fg_att =  @twoAtt + @threeAtt
    ft_perct = percent(@ftMade, @ftAtt)
    two_perct = percent(@twoMade, @twoAtt)
    three_perct = percent(@threeMade, @threeAtt)
    fg_perct = percent(fg_made, fg_att)
    puts "\n\t\tSHOOTING STATISTICS"
    dashes
    puts "\t\tPoints:                 #{@points}"
    dashes
    puts "\t\tFTMade:                 #{@ftMade}"
    puts "\t\tFTAttempted:            #{@ftAtt}"
    puts "\t\tFT%:                    #{ft_perct}"
    dashes
    puts "\t\t2PMade:                 #{@twoMade}"
    puts "\t\t2PAttempted:            #{@twoAtt}"
    puts "\t\t2P%:                    #{two_perct}"
    dashes
    puts "\t\t3PMade:                 #{@threeMade}"
    puts "\t\t3PAttempted:            #{@threeAtt}"
    puts "\t\t3P%:                    #{three_perct}"
    dashes
    puts "\t\tFGMade:                 #{fg_made}"
    puts "\t\tFGAttempted:            #{fg_att}"
    puts "\t\tFG%:                    #{fg_perct}" 
    puts "\n"
  end

  def player_info
    puts "\n\n\n"
    puts "\t\tPLAYER INFO"
    dashes
    puts "\t\tName:                  #{@name}"
    puts "\t\tNumber:                #{@number}"
    puts "\t\tAge:                   #{@age} years old"
    puts "\t\tHeight:                #{@height} inches"
    puts "\t\tWeight:                #{@weight} pounds"
    puts "\t\tPosition:              #{@position}"
    puts "\n" 
  end

  def display
    puts "\n\n\t\t\##{@number} #{@name}"
    dashes
    shot_info
    reb_info
    asst_info
    steal_info
    block_info
    turn_info
    puts "\n\n"
  end

  def dashes
    puts "\t\t----------------------------"
  end

  def inspect
    puts "-----"
  end

end  #<-- END Player Class -->

