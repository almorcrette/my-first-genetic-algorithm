require "./Mazes.rb"
require "./Populations.rb"
require "./RobotFunctions.rb"
require "./RunGeneration.rb"

class RobbyExperiment
    include Mazes
    include Population
    include RobotFunctions
    include RunGeneration
    
    def decode_instructions
        <<-HEREDOC
            0 means 'Stay put'
            1 means 'Move one space north'
            2 means 'Move one space east'
            3 means 'Move one space south'
            4 means 'Move one space west'
            5 means 'Attempt to pick up can'
            6 means 'Move one space in a random direction.
        HEREDOC
    end
    
end

p "Creating a new Robby Experiment..."
exp = RobbyExperiment.new
p "New Robby Experiment created: new RobbyExperiment class instantiated, with the following modules: Mazes, Population, and RobotFunctions"


p "Creating mazes..."
mazes = exp.create_n_mazes(20, 10, 0.5)
p "#{mazes.length} mazes created!"


## Script to display all mazes ##

=begin
mazes.each do |maze|
    maze.each { |x| puts x.join(" ") }
    puts nil
end
=end

## End of script to display all mazes ##

p "Creating a population of robots with random genomes..."
population = exp.random_population(50)
p "Population of #{population.length} robots with random genomes created!"

#lonely_genotype = population[0]
#puts "The only genotype is:"
#p lonely_genotype.values.join("")
#p exp.decode_instructions


population_scores = exp.run_generation(population, mazes, 200)
p population_scores

=begin
new_score, new_position, new_maze = exp.act(starting_position, maze, starting_score, lonely_genotype)
puts "The new score is:"
p new_score

puts "The new position is:"
p new_position
puts "The maze now looks like"
new_maze.each { |x| puts x.join(" ") }
=end
