# Conway's Game of Life

* Practise tech test.
* A zero-player game in which the cells in an orthogonal grid evolve according to the following rules:
    1. Each cell has eight 'neighbours'.
    2. Any live cell with fewer than two live neighbours dies ('underpopulation').
    3. Any live cell with two or three live neighbours lives on to the next generation.
    4. Any live cell with more than three live neighbours dies ('overpopulation').
    5. Any dead cell with exactly three live neighbours becomes a live cell ('reproduction').
* To play clone and navigate into this repository, open `pry` or `irb`, and then try:                  
`require './lib/game.rb'`               
`game = Game.new(SampleGridMaker.new.blinker)`                
`game.print_grid`              
`game.tick`               
`game.print_grid`               
`game.tick`                
`game.print_grid`          
In this case you will see the grid oscillating between two configurations.  Instead of `blinker` you can try `glider`, `beacon`, or `toad`.  Or...
* Try making your own grids!  The grid is a 2D array of cells, each of which are initiated as `live = true` or `live = false`.  For example...           
`my_grid = [[Cell.new(false), Cell.new(true)], [Cell.new(true), Cell.new(false)]]`                        
...makes a grid like this:                   
[ ][x]                 
[x][ ]     
And then you can start the game like this:        
`game = Game.new(my_grid)`              
* To be improved:                
I'd like to build a front end!
