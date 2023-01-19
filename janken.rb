class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets
    while true
      if input_hand.include?("0") || input_hand.include?("1") || input_hand.include?("2")
        input_hand_to_i = input_hand.to_i 
        return input_hand_to_i
      else
        puts "0〜2の数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets
      end
    end
  end
end

class Enemy
  def hand
    enemy_hands = (0..2).to_a
    enemy_hand = enemy_hands.sample
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
    if player_hand == enemy_hand
      puts "あいこ"
      true
    elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      puts "あなたの勝ちです"
      false
    else
      puts "あなたの負けです"
      false
    end
  end
end

class GameStart
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    while next_game
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
GameStart.jankenpon