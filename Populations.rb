# generate population of random genonome function
module Population
    
=begin - following two methods should now be defunct
    def gen_rand_genome_pop(x)
    
        all_contexts = []
        
        loop do # populates an all_contexts array by randomly generating contexts and adding them if they are not already in the array until we reach the 243 possible contexts
            
            feature_options = ["wall", "empty", "can"]
            
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
        
        population = [] #instantiate the variable which will become the array containing the 50 genonomes
        
        behaviour_options = (0...7).to_a
        
        x.times do
            genotype = {}
            all_contexts.each { |context| genotype[context] = behaviour_options.sample } #randomly allocate a behaviour option (a.k.a. an instruction) to each of the possible contexts
            population << genotype
        end
            
        population
        
    end
=end

    def random_genome
        genome = ""
        (3 ** 5).times do
            genome += rand(7).to_s
        end
        genome
    end
    
    def random_population(n)
        population = []
        n.times { population << random_genome() }
        population
    end

end

