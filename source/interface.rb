class Interface
  def ask_name
    puts "What is your name?"
    gets.chomp.capitalize
  end

  def show_name(player)
    name = player.name
    puts "#{name.upcase}:"
  end

  def show_hand(player, *dealer_shows=false)
    print "Cards:"
    player.hand.each do |card|
      if (player.name != "Dealer") || dealer_shows
        print " #{card[:suit]}#{card[:value]}"
      else
        print " ##"
      end
    end
    puts "."
  end

  def show_stack(player)
    stack = player.stack
    puts "Stack: $#{stack}."
  end

  def show_points(player)
    points = player.get_points
    puts "Points: #{points}."
  end

  def show_bank(bank)
    puts "Bank: $#{bank}."
  end

  def show_line
    puts ""
  end

  def show_history(history)
    history.each { |action| puts action}
  end

  def show_menu(menu)
    puts "\nChoose your action (put the number):"
    menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[0].to_s.capitalize}."
    end
    print '>> '
    item_index = gets.to_i
    check_item_index(item_index, menu)
  end

  def check_item_index(item_index, menu)
    until (1..menu.size).cover?(item_index)
      puts "\nChoose the correct number (1..#{menu.size}) of action:"
      item_index = gets.to_i
    end
    item_index
  end
end
