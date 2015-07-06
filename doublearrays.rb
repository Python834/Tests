

cells = [
    [ 'a', 'b','c','d','e' ],  # 0
    [ 'f', 'g','h','i','j' ],  # 1
    [ 'k', 'l','m','n','o' ],  # 2
    [ 'p', 'q','r','s','t' ],  # 3
    [ 'u', 'v','w','x','y' ]   # 4
]
puts cells.length
puts cells[0].inspect
puts cells[0][1]
puts cells[2][2]

maze = [
    [ 'X','X','X','X','X' ],  # 0
    [ 'X',' ',' ',' ','X' ],  # 1
    [ 'X','F',' ',' ','X' ],  # 2
    [ 'X','X','X',' ','X' ],  # 3
    [ 'X',' ',' ',' ','X' ],  # 4
    [ 'X',' ','S',' ','X' ],  # 5
    [ 'X','X','X','X','X' ]   # 6
#      0   1   2   3   4
]

# temp = maze[1][1]
# maze[1][1] = maze[2][1]
# maze[2][1] = temp

maze[1][1], maze[2][1] = maze[2][1], maze[1][1]
# maze.each do | row |
#     row.each do | col |
#         print col
#     end
#     puts
# end
maze.each do |row|
    puts row.join( '' )
end

m = ""
maze.each do |row|
    m += row.join(',') + ','
end
puts m

class Puz
    def initialize( rows, cols )

    end
end