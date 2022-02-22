# robot sensing function

module RobotFunctions

    def sense(current_position, current_maze)
        
        context = {} #create empty context hash to be populated
        
        # Sense in the northern direction
        if current_position[0]-1 < 0
            context["north"] = "wall"
        elsif current_maze[current_position[0]-1][current_position[1]] == 1
            context["north"] = "can"
        else
            context["north"] = "empty"
        end
        
        # Sense in the southern direction
        if current_position[0]+1 >= current_maze.length
            context["south"] = "wall"
        elsif current_maze[current_position[0]+1][current_position[1]] == 1
            context["south"] = "can"
        else
            context["south"] = "empty"
        end
            
        # Sense in the eastern direction
        if current_position[1]+1 >= current_maze.length
            context["east"] = "wall"
        elsif current_maze[current_position[0]][current_position[1]+1] == 1
            context["east"] = "can"
        else
            context["east"] = "empty"
        end
        
        # Sense in the western direction
        if current_position[1]-1 < 0
            context["west"] = "wall"
        elsif current_maze[current_position[0]][current_position[1]-1] == 1
            context["west"] = "can"
        else
            context["west"] = "empty"
        end
        
        # Sense current space
        if current_maze[current_position[0]][current_position[1]] == 1
            context["current"] = "can"
        else
            context["current"] = "empty"
        end
        
        context
        
    end

# interpret genome

    def interpret_genome(genome)
        feature_options = ["wall", "empty", "can"]
        all_contexts = []
        loop do # populates an all_contexts array by randomly generating contexts and adding them if they are not already in the array until we reach the 243 possible contexts
            
            context = {
                "current" => feature_options.sample,
                "north" => feature_options.sample,
                "east" => feature_options.sample,
                "south" => feature_options.sample,
                "west" => feature_options.sample
            }
            
            
            all_contexts << context
            
            all_contexts.uniq!
            
            break if all_contexts.length == 3 ** 5 
            
            all_contexts
            
        end
        
        behaviour_space = Hash[all_contexts.zip(genome.split(""))]
        
        return behaviour_space
        
    end

# robot action

    def act(current_position, current_maze, current_score, behaviour_space)
        
        context = sense(current_position, current_maze)
        #puts "The context is #{context}."
        #p "The gene for this context is #{genotype[context]}."
        
        #if the instruction for that context in the genotype is 6, which means move in a random direction
        # set the instruction to random number between 1 - 4 inclusive, which will provide a specific instruction
        # to move in one of the compass directions
        #if the instruction is not , then set the instruction to genotype[context]
        behaviour_space[context] == "6" ? instruction = rand(1..4).to_s : instruction = behaviour_space[context]
        #p "The instruction for the robot is #{instruction}"
        
        case instruction 
            when "0"
                new_score = current_score
                new_position = current_position
                new_maze = current_maze
                
            when "1" # =>                                                             instruction to move north:
                if current_position[0]-1 < 0 # =>                                       first check whether moving in that direction hits a wall
                    new_score = current_score - 5 # =>                                  if hits a wall, then -5 to score
                    new_position = current_position # =>                                then robot doesn't move
                    new_maze = current_maze # =>                                        and maze doesn't change.
                else # =>                                                               if going north doesn't hit a well, then
                    new_score = current_score # =>                                      score doesn't change
                    new_position = [ current_position[0] - 1, current_position[1] ] # =>new position is one move from old position in the relevant direction
                    new_maze = current_maze # =>                                        and maze doesn't change
                end
             
            
            # otherwise, return new position which is one up from current position and current maze, and new score
            when "2" # instruction to move east
                if current_position[1]+1 >= current_maze.length # =>                    first check whether moving in that direction hits a wall
                    new_score = current_score - 5 # =>                                  if hits a wall, then -5 to score
                    new_position = current_position # =>                                then robot doesn't move
                    new_maze = current_maze # =>                                        and maze doesn't change.
                else # =>                                                               if going north doesn't hit a well, then
                    new_score = current_score # =>                                      score doesn't change
                    new_position = [ current_position[0], current_position[1] + 1 ] # =>new position is one move from old position in the relevant direction
                    new_maze = current_maze # =>                                        and maze doesn't change
                end
            
            when "3" # instruction to move south
                if current_position[0]+1 >= current_maze.length # =>                   first check whether moving in that direction hits a wall
                    new_score = current_score - 5 # =>                                  if hits a wall, then -5 to score
                    new_position = current_position # =>                                then robot doesn't move
                    new_maze = current_maze # =>                                        and maze doesn't change.
                else # =>                                                               if going north doesn't hit a well, then
                    new_score = current_score # =>                                      score doesn't change
                    new_position = [ current_position[0] + 1, current_position[1] ] # =>new position is one move from old position in the relevant direction
                    new_maze = current_maze # =>                                        and maze doesn't change
                end
            
            when "4" # instruction to move west
                if current_position[1]-1 < 0 # =>                                       first check whether moving in that direction hits a wall
                    new_score = current_score - 5 # =>                                  if hits a wall, then -5 to score
                    new_position = current_position # =>                                then robot doesn't move
                    new_maze = current_maze # =>                                        and maze doesn't change.
                else # =>                                                               if going north doesn't hit a well, then
                    new_score = current_score # =>                                      score doesn't change
                    new_position = [ current_position[0], current_position[1] - 1 ] # =>new position is one move from old position in the relevant direction
                    new_maze = current_maze # =>                                        and maze doesn't change
                end
                    
    
            when "5" # instruction to attempt to pick up can
                if current_maze[current_position[0]][current_position[1]] == 1 # =>     if current position in the maze is a 1, then there's a can, then
                    new_score = current_score + 10 # =>                                 update score +10, return current_position, new_score, and new maze which is the old maze but
                    new_position = current_position
                    new_maze = current_maze
                    new_maze[current_position[0]][current_position[1]] = 0
                else
                    new_score = current_score - 1
                    new_position = current_position
                    new_maze = current_maze
                end
        end
        
        return new_score, new_position, new_maze    
            
    end
    
    ## Script defining function "Complete Run".
        ## Runs robot with a given genome...
            ## through a given number of moves...
            ## in a given maze...
            ## from a given starting position.
        ## Outputs its final score.
        ## Makes use of the "Act" function
            ## which itself makes use of the "Sense" function.

    def complete_run(number_of_moves, starting_position, initial_maze, behaviour_space)
        position = starting_position
        maze = initial_maze
        score = 0
        number_of_moves.times do
            score, position, maze = act(position, maze, score, behaviour_space)
            #puts "New position is #{position} and new score is #{score}"
            
        end
        #puts "Final position after #{number_of_moves} moves is #{position} and final score is #{score}"
        return score
    end
    
    ## End of the script defining function "Complete Run".
    
end
