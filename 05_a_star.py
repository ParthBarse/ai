def a_star_search(grid, start, goal):
    def heuristic(node):
        # A simple heuristic (Manhattan distance) for grid-based pathfinding
        return abs(node[0] - goal[0]) + abs(node[1] - goal[1])

    open_set = [(0, start)]  # Priority queue with (f_cost, node) tuples
    came_from = {}  # Dictionary to store parent nodes
    g_score = {node: float('inf') for row in grid for node in row}
    g_score[start] = 0

    while open_set:
        open_set.sort(key=lambda x: x[0])
        current = open_set.pop(0)[1]

        if current == goal:
            path = []
            while current in came_from:
                path.append(current)
                current = came_from[current]
            path.append(start)
            return list(reversed(path))

        for neighbor in [(current[0] + 1, current[1]), (current[0] - 1, current[1]),
                         (current[0], current[1] + 1), (current[0], current[1] - 1)]:
            if 0 <= neighbor[0] < len(grid) and 0 <= neighbor[1] < len(grid[0]) and grid[neighbor[0]][neighbor[1]] != 1:
                tentative_g_score = g_score[current] + 1

                if tentative_g_score < g_score.get(neighbor, float('inf')):
                    came_from[neighbor] = current
                    g_score[neighbor] = tentative_g_score
                    f_score = tentative_g_score + heuristic(neighbor)
                    open_set.append((f_score, neighbor))

    return None  # No path found

# Example usage:
grid = [
    [0, 0, 0, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 0, 0]
]

start = (0, 0)
goal = (4, 4)

path = a_star_search(grid, start, goal)

if path:
    print("Path:", path)
else:
    print("No path found.")
