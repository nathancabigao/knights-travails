# Knights Travails
A Ruby Chess Knight move optimizer made in Ruby.

This program optimizes the number of moves to get from one space to another, while also providing an example path to do so.

Note, the board is displayed in numbers, from 0-7 in the following format `[col, row]`. 

For example, from common chess notation to this program's notation:

A1 is `[0, 0]`, B3 is `[1, 2]`.

This project was done for [The Odin Project](https://www.theodinproject.com/lessons/ruby-knights-travails).

## Instructions
To run the driver script to test the implementation, clone the repo and run the following from the root folder:
`ruby ./main.rb`

## Afterword
This project proved to be harder than expected, but simple once I realized that Breadth-First Search is what we would want to use here. I realized early on that using a BFS approach would get the lowest-depth Knight that is at the target location. That being said, I did struggle as I first attempted to treat Knights not as Tree objects in the sense that it would have a parent/children, but as Tree objects that would simply have an array of previous locations. In doing so, my implementation's 'history' array included 'children' of other nodes that were unrelated and my solution was never quite correct. I then went back and refactored my code to treat the Knight class as a more traditional Tree object that link to other Knights. From creating a parent instance variable, I could easily get a path from the Knight found by BFS to the original root Knight that started the BFS.

With these thoughts in mind, this project proved how powerful Data Structures and their associated Algorithms are. I tried to find a different way to find a solution, but treating Knights as Nodes in a Tree and finding the solution via BFS led to a concrete solution.