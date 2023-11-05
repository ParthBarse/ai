def is_safe(graph, v, c, color):
    # Check if it is safe to color vertex v with color c
    for i in range(len(graph)):
        if graph[v][i] and color[i] == c:
            return False
    return True

def graph_coloring(graph, m):
    n = len(graph)
    color = [-1] * n  # Initialize color array

    def backtrack(v):
        if v == n:
            return True

        for c in range(1, m + 1):
            if is_safe(graph, v, c, color):
                color[v] = c
                if backtrack(v + 1):
                    return True
                color[v] = 0  # Backtrack

        return False

    if not backtrack(0):
        return None  # No valid coloring found

    return color

# Example usage:
graph = [
    [0, 1, 1, 1],
    [1, 0, 1, 0],
    [1, 1, 0, 1],
    [1, 0, 1, 0]
]

m = 3  # Maximum number of colors
coloring = graph_coloring(graph, m)

if coloring:
    print("Graph coloring:", coloring)
else:
    print("No valid coloring exists.")
