def dijkstra(graph, start, end):
    dist = {node: float('inf') for node in graph}
    prev = {node: None for node in graph}
    dist[start] = 0
    unvisited = set(graph)

    while unvisited:
        current = min(unvisited, key=lambda node: dist[node])
        unvisited.remove(current)

        for neighbor, weight in graph[current].items():
            alt = dist[current] + weight
            if alt < dist[neighbor]:
                dist[neighbor] = alt
                prev[neighbor] = current

    path = []
    while end:
        path.insert(0, end)
        end = prev[end]

    return path

# Example usage:
G = {
    'A': {'B': 2, 'C': 5},
    'B': {'C': 1, 'D': 7},
    'C': {'D': 3},
    'D': {'E': 4},
    'E': {'A': 2}
}

start = 'A'
end = 'D'

result = dijkstra(G, start, end)
print("Shortest Path:", result)
