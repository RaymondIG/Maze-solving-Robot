# Maze-solving-Robot
# 🧩 Maze Solver using Breadth-First Search (BFS) in MATLAB

This project implements a simple maze-solving algorithm in MATLAB using the **Breadth-First Search (BFS)** technique. The algorithm finds the shortest path from a start point to a goal in a 2D maze.

---

## 📁 Project Structure

- `maze_solver.m`: Main MATLAB script that:
  - Defines and displays the maze
  - Calls the BFS solver
  - Animates the solution path
- `bfs_maze_solver`: Internal function that performs the BFS logic

---

## 🧠 How It Works

1. The maze is represented as a 2D grid:
   - `0` = path
   - `1` = wall
   - `3` = goal
2. The algorithm starts from a given start point and uses BFS to explore the maze.
3. It ensures the shortest path is found by expanding outward step-by-step.
4. Once the goal is reached, the path is reconstructed and animated on the maze.

---

## 🚀 How to Run

1. Open the `maze_solver.m` script in MATLAB.
2. Run the script (`F5` or Run button).
3. A figure will display the maze, and the solution will animate step-by-step.

---

## 🔍 Example Maze

```text
1 1 1 1 1 1 1
1 0 0 0 1 0 1
1 0 1 0 0 0 1
1 0 1 0 1 3 1
1 1 1 1 1 1 1
