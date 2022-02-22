module RunGeneration
    
    require "./RobotFunctions.rb"
    
    include RobotFunctions
    
    def run_generation(population, mazes, num_moves)
        population_scores = {}
        population.each do |genome|
            behaviour_space = interpret_genome(genome)
            genome_scores = []
            mazes.each do |maze|
                starting_position = [0, 0]
                score = complete_run(num_moves, starting_position, maze, behaviour_space)
                genome_scores << score
            end
            ave_genome_scores = genome_scores.sum / genome_scores.size
            population_scores[genome] = ave_genome_scores
        end
        return population_scores
    end
    
end