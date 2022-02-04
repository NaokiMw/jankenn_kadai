puts "じゃんけん..."

#プレイヤー側のじゃんけんのメソッド

def janken_player
  puts "0(グー）1(チョキ)2（パー）3（戦わない）"
  $player_number = gets.chomp.to_s
  puts "ホイ！"
  puts "----------------------------------------"
  
  if $player_number == "0"
    puts "あなたはグーを出しました"
    janken_cpu()
    
    elsif $player_number == "1"
      puts "あなたはチョキを出しました"
      janken_cpu()
      
      elsif $player_number == "2"
        puts "あなたはパーを出しました"
        janken_cpu()
        
        elsif $player_number == "3"
          puts "あなたはジャンケンをやりません"
          
          else 
            puts "0~3の数字を入力してください"
            return true
            
            end
            end

#CPU側のじゃんけんのメソッド

def janken_cpu
  cpu = rand(3).to_s
  
  if (($player_number == "0" || $player_number == "1"|| $player_number == "2") && cpu == "0")
    puts "あいてはグーを出しました"
    $cpu_number = "0"
    cpu_selects()
    
    elsif (($player_number == "0" || $player_number == "1" || $player_number == "2") && cpu == "1")
      puts "あいてはチョキを出しました"
      $cpu_number = "1"
      cpu_selects()
      
      else (($player_number == "0" || $player_number == "1" || $player_number == "2") && cpu == "2")
        puts "あいてはパーを出しました"
        $cpu_number = "2"
        cpu_selects()
        
        end
        end

#あっち向いてほいのCPUの顔と指の向きのメソッド
def cpu_selects 
  cpu_select = rand(4).to_i
  
  if cpu_select == 0
    $cpu_directions = "上" 
    hoi()
    
    elsif cpu_select == 1
      $cpu_directions = "右"
      hoi()
      
      elsif cpu_select == 2
        $cpu_directions = "左"
        hoi()
        
        else cpu_select == 3
          $cpu_directions = "下"
          hoi()
          
          end
          end

#プレイヤーあっち向いてほいの顔と指を選択するメソッド

def hoi
  $player_directions = ["上","右","左","下"]
  if $player_number == $cpu_number
    puts "あいこです"
    puts "----------------------------------------"
    puts "じゃんけん"
    return true 
    
    elsif ($player_number == "0" && $cpu_number == "1") || ($player_number == "1" && $cpu_number == "2") || ($player_number == "2" && $cpu_number == "0")
      puts "----------------------------------------"
      puts "指を指す方向を決めてください"
      puts "上（0）、右（1）、左（2）、下（3）"
      finger_select = gets.chomp.to_i
      puts "あなた" + $player_directions[finger_select]
      puts "相手" + $cpu_directions
      $result_direction = "パターンA" + "#{$player_directions[finger_select]}" + "#{$cpu_directions}"
      result()
      
      else
        puts "----------------------------------------"
        puts "顔を向ける方向を決めてください"
        puts "上（0）、右（1）、左（2）、下（3）"
        face_select = gets.chomp.to_i
        puts "あなた" + $player_directions[face_select]
        puts "相手" + $cpu_directions
        $result_direction = "パターンB" + "#{$player_directions[finger_select]}" + "#{$cpu_directions}"
        result()
        
        end
        end

#あっち向いてホイの勝敗のメソッド

def result
  if ($result_direction == "パターンA上上") || ($result_direction == "パターンA右右") || ($result_direction == "パターンA左左") || ($result_direction == "パターンA下下")
    puts "----------------------------------------" 
    puts "あなたの勝ちです"
    
    elsif ($result_direction == "パターンB上上") || ($result_direction == "パターンB右右") || ($result_direction == "パターンB左左") || ($result_direction == "パターンB下下")
      puts "----------------------------------------" 
      puts "あなたの負けです"
      
      else
        puts "----------------------------------------" 
        puts "引き分けです"
        puts "----------------------------------------" 
        puts "じゃんけん" 
        return true
        
        end
        end

#繰り返す為のwhile文
next_janken = true
while next_janken do
  next_janken = janken_player 
  end
