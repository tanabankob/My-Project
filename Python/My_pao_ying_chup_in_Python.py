def game_start():
    import pandas as pd
    import numpy as np
    from random import choice
    n = 0
    round_game = 0
    play = True

    #Create score table
    user_score = 0
    com_score = 0

    ##create Playcontrol fuction
    def play_ctrl():
        print("Would you like to play again?(y/n)")
        user_r = input("Please select y or n :").lower()

        #check value
        if user_r == 'y':
            return True
        elif user_r == 'n':
            return False
        else:
            print("Your answer is wrong, please select only 'y' or 'n'")
            return play_ctrl()

    ## Number of Round
    def number_round():
        nonlocal n

        try:

            # question to User
            print("How many round would you like to play?")

            #Get value
            n = int(input("Please select a round to play :"))

            #Check value
            if pd.isna(n) or int(n) < 1:
                    print("Please enter a number greater than zero.")
                    return number_round()

            else:
                return n

        except:
            print("Your answer is wrong, please select only number.")
            return number_round()
    def core_game():
        nonlocal round_game
        nonlocal com_score
        nonlocal user_score
        #Create List action
        action_list = [" ","ค้อน", "กรรไกร", "กระดาษ"]
        def choice_rand(): 
             print("""What is your choice?
                1 : Hammer
                2 : Scissors
                3 : Paper""")
             try:
                user_choice = int(input("Please select a number (1-3) :"))  
                if user_choice < 1 or user_choice > 3:
                    print("Your answer is wrong, please select only number 1-3")
                    return choice_rand()
                else:
                    return user_choice
             except ValueError:
                print("pleas select again")
                return choice_rand()
               
        
        while round_game < n:
                print(f"-----Round : {round_game + 1}-----")
                com_action = np.random.randint(1,4)
                user_action = choice_rand()
                round_game += 1 
                print("🔥🔥🔥🔥🔥Battle Start🔥🔥🔥🔥🔥")
                print(f"🙋Your choice: {action_list[user_action]}")
                print(f"🖥️Computer choice: {action_list[com_action]}")
                if  (user_action == 1 and com_action == 2) or\
                    (user_action == 2 and com_action == 3) or\
                    (user_action == 3 and com_action == 1):
                     print("-----You win🏆-----")
                     user_score += 1
                elif user_action == com_action:
                     print("-----Tie-----")
                else:
                     print("-----You lose💀-----")
                     com_score += 1
                print("""
                              """)
        # show result
        print("""=== Final Score ===
              
              """)
        print(f"Your score is : {user_score}")
        print(f"Computer score is : {com_score}")
        print("""Fianal Battle is :""")
        print("=== You win ===" if user_score > com_score  else "=== You lose ===" if user_score < com_score else "=== Tie ===")
    
    number_round()
    core_game()
    play_0 = play_ctrl()
    if play_0:
         return game_start()
    else:
         print("Thak you")
    

game_start()
