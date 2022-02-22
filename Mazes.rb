# create maze function
module Mazes

    def create_maze(size, proportion_cans)
        size = size.to_i
        canned = proportion_cans.to_f
        maze = []
        for r in 0...size do
            row = []
            for c in 0...size do
                row[c] = 0
            end
            maze[r] = row
        end
        
        (canned * (size * size)).to_i.times do
            random = rand(1..(size * size))
            u = random % size
            t = ((random - (random % size)) / size) -1
            maze[u][t] = 1
        end
        
        return maze
    
    end
    
    def create_n_mazes(number, size, proportion_cans)
        mazes = []
        number.times do
            mazes << create_maze(size, proportion_cans)
        end
        return mazes
    end

end
