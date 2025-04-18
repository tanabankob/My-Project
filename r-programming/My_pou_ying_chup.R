## Crate a function
game_start <- function() {
  #Condition for start game
  play <- TRUE
  
  #Create score table
  user_score <- 0
  com_score <- 0
  
  #Would you like to play again
  play_ctrl <- function() {
    
    ##question to User
    cat("Would you like to play again?(y/n)")
    
    ##Get value from User
    user_r <- tolower(readline("Please select y or n :"))
    
    ##Check value
    if(user_r == "y") {
      return(TRUE)
    } else if (user_r == "n") {
      return(FALSE)
    } else {
      print("Your answer is wrong, please select only 'y' or 'n'")
      return(play_ctrl())
    }
  }  
  
  #Number of Round
  number_round <- function() {
  
  ##question to User
  cat("How many round would you like to play?")
  
  ##Get value
  n <- as.integer(readline("Please select a round to play :"))
  
  ##Check value
  if(is.na(n) || n < 1 ) {
      print("Your answer is wrong, please select only number")
      return(number_round())
    } else {
      return(n)
    }
  }
  
  n <- number_round()
  
  round <- 1
  
  ### Core strat function ######
    start_game <- function() {
    
      while (round <= n) {
    
    print(paste("-----Round :", round,"-----"))
    
    #Create List action
    action <- c("Hammer", "Scissor", "Paper")
    
    #Create User fuction
    user_random <- function(user_choice){
      
      ##question to User
      cat("What is your chioce?\n",
          "1 : Hammer\n",
          "2 : Scissore\n",
          "3 : Paper\n")
      
      ##Get value frome User
      user_choice <- as.integer(readline("Please select a number (1-3) :"))
      
      ##Check value
      if(is.na(user_choice) || user_choice < 1 || user_choice > 3) {
        print("Your answer is wrong, please select only number 1-3")
        return(user_random())
      } else {return(user_choice)}
      
    }
    
    #Create Com fuction
    com_random <- function() {
      return(sample(1:3, 1))
    }
    
    #Get Choice
    user_choice <- user_random()
    com_choice <- com_random()
    
    #Show Battle
    Sys.sleep(1)
    print("🔥🔥🔥🔥🔥Battle Start🔥🔥🔥🔥🔥")
    #print()ต้องใส่paste()ไม่งั้นจะไม่สมบูรณ์รันไม่ออก
    Sys.sleep(1)
    print(paste("🙋Your choice:", action[user_choice]))
    #cat()จะใส่paste()หรือไม่ใส่ก็ได้
    Sys.sleep(1)
    print(paste("🖥️Computer choice:", action[com_choice]))
    #Condition for Win or lose
    if ((user_choice == 1 & com_choice == 2) | 
        (user_choice == 2 & com_choice == 3) |
        (user_choice == 3 & com_choice == 1)) {
      Sys.sleep(1)
      print("-----You win🏆-----")
      user_score <- user_score + 1
    } else if (user_choice == com_choice ) {
      Sys.sleep(1)
      print("-----Tie-----")
    } else {
      Sys.sleep(1)
      print("-----You lose💀-----")
      com_score <- com_score + 1
    } 
    
    #Show current score
    Sys.sleep(1)
    print(paste("Your score is : ", user_score))
    print(paste("Com score is : " , com_score))
    cat("\n\n\n\n")
    
    #Count Round
    round <- round + 1
    
    # สรุปผลรวมหลังเล่นครบ
    cat("==== Final Score ====\n")
    cat("You:", user_score, "\n")
    cat("Computer:", com_score, "\n")
    if (user_score > com_score) {
      cat("🏆 You win the game!\n")
    } else if (user_score < com_score) {
      cat("💀 You lose the game.\n")
    } else {
      cat("😐 It's a tie!\n")
    }
    cat("=====================\n\n")
    }
  }

    ##### End core strat function ######
  
  ### ส่วนของการรันเกม
  start_game()
  
  play <- play_ctrl()
  
  if (play == TRUE) {
    game_start()
  } else {
    cat("Thanks for playing! 👋\n")
  }
} 

#### Play game!

game_start()
