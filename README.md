## **About this project**

In this personal project, I am building a genetic algorithm that will evolve an
programme that effectively / efficiently completes a designated task.

The task is to go around a grid picking up 'cans' that are in some spaces but not
others, without crashing into the walls at the edge of the grid, or wasting time
trying to pick up cans on spaces where there are none.

The process of evolution happens by initiating a population of random programs,
testing them on a set of randomly generated grids with cans (using a scoring
system to generate comparable scores), selecting a new generation of programs
using a combination of survival of the fittest, breeding among the fittest,
and some random mutations, and repeating for a number of generations.

Over a significant number of generations, the population should become better at
completing the task. Eventually it may generate a program that is better at the
task than an intuitive human strategy.

The selection process involves coding 'genes' for each of the programs, which can
be spliced to allow breeding between pairs and which can be randomly mutated.
Hence why this is a 'genetic' algorithm.

## **Acknowledgement and inspiration for this project**

This personal project is based on Melanie Mitchell's Robby the Robot, in her
book Complexity: a Guided Tour, which also features in her Introduction to
Complexity course on Sante Fe Institute's Complexity Explorer. Melanie Mitchell
is a Professor of Computer Science at Portland State University, and External
Professor and Member of the Science Board at the Santa Fe Institute.

I thoroughly recommend the course if you are interested in learning more about
the fundementals of complexity science, in diverse fields of biology, economics,
physics, computer science and social sciences.

Robby the Robot is itself inspired by [Herbert, the Soda Can Collecting Robot
that wandered the halls of MIT in the late 80s](http://cyberneticzoo.com/cyberneticanimals/1986c-herbert-the-collection-machine-brooks-connell-ning-american/).

## **Find out more about genetic algorithms and genetic programming**

For a fun example of what genetic algorithms and genetic programming can do,
check out the work of Karl Sims. [Here's a video of his evolving virtual
creatures](https://www.youtube.com/watch?v=JBgG_VSP7f8).

For current research on adaptive computation, [see Stephanie Forrest's work](https://forrest.biodesign.asu.edu/index.html).

## **About the quality of my coding**

I am a coding novice, and this project is a chance for me to learn to code.
That's why I have started coding this in Ruby, as this is the coding language
that I am currently learning. I appreciate that means my project is likely to
run significantly less efficiently than if it was optimised with a more
efficient language (putting aside the inefficiencies of novice code!) I expect
to consider the efficiency of the algorithm as part of my learning
curve, as this algorithm is going to take a fair amount of processing.

I will be adding to this README and the comments in the various scripts as I
go along, to dig deeper into how I'm building the algorithm.

*Alexis Morcrette - March 3, 2022*
