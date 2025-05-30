clc; clear; close all;

% --- 1. Define the Maze ---
% 0 = path, 1 = wall, 3 = goal
maze = [1 1 1 1 1 1 1;
        1 0 0 0 1 0 1;
        1 0 1 0 0 0 1;
        1 0 1 0 1 3 1;
        1 1 1 1 1 1 1];

start = [4,2];      % Start position (row, col)
goal = [4,6];       % Goal position (row, col)

% --- 2. Visualize the Maze ---
figure;
imagesc(maze);
colormap([1 1 1; 0 0 0; 0 1 0; 1 0 0]); % white=path, black=wall, green=start, red=goal
axis equal tight;
axis off;
hold on;
plot(start(2), start(1), 'go', 'MarkerSize', 10, 'LineWidth', 2); % Start
plot(goal(2), goal(1), 'ro', 'MarkerSize', 10, 'LineWidth', 2);   % Goal

% --- 3. Call the Solver ---
path = bfs_maze_solver(maze, start, goal);

% --- 4. Animate the Path ---
for i = 1:size(path,1)
    plot(path(i,2), path(i,1), 'bo', 'MarkerSize', 8, 'LineWidth', 1.5);
    pause(1);
end

% --- 5. BFS Maze Solver Function ---
function path = bfs_maze_solver(maze, start, goal)
    queue = {start};
    visited = zeros(size(maze));
    visited(start(1), start(2)) = 1;
    parent = containers.Map;
    key = @(p) sprintf('%d,%d', p(1), p(2));

    while ~isempty(queue)
        current = queue{1};
        queue(1) = [];

        if isequal(current, goal)
            break;
        end

        neighbors = [0 1; 1 0; 0 -1; -1 0]; % right, down, left, up
        for i = 1:4
            neighbor = current + neighbors(i,:);
            r = neighbor(1); c = neighbor(2);

            if r >= 1 && r <= size(maze,1) && c >= 1 && c <= size(maze,2)
                if maze(r,c) ~= 1 && visited(r,c) == 0
                    visited(r,c) = 1;
                    queue{end+1} = neighbor;
                    parent(key(neighbor)) = current;
                end
            end
        end
    end

    % Reconstruct path
    path = goal;
    while ~isequal(path(1,:), start)
        path = [parent(key(path(1,:))); path];
    end
end