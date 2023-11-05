# def selection_sort(n):
#     for i in range(len(n)):
#         min_ind = i
#         for j in range(i+1, len(n)):
#             if n[j] < n[min_ind]:
#                 min_ind = j
#         n[i], n[min_ind] = n[min_ind], n[i]
#     return n

# def dijkstra(graph, source):
#     v = len(graph)
#     distance = [float("inf")] * v
#     visited = [False] * v

#     distance[source] = 0

#     for _ in range(v - 1):
#         min_dist = float("inf")
#         for i in range(v):
#             if not visited[i] and distance[i] < min_dist:
#                 min_dist = distance[i]
#                 u = i

#         visited[u] = True

#         for j in range(v):
#             if not visited[j] and graph[u][j] and distance[u] + graph[u][j] < distance[j]:
#                 distance[j] = distance[u] + graph[u][j]

#     return distance

# # Example usage:
# graph = [
#             [ 0, 4, 0, 0, 0, 0, 0, 8, 0 ],
#             [ 4, 0, 8, 0, 0, 0, 0, 11, 0 ],
#             [ 0, 8, 0, 7, 0, 4, 0, 0, 2 ],
#             [ 0, 0, 7, 0, 9, 14, 0, 0, 0 ],
#             [ 0, 0, 0, 9, 0, 10, 0, 0, 0 ],
#             [ 0, 0, 4, 14, 10, 0, 2, 0, 0 ],
#             [ 0, 0, 0, 0, 0, 2, 0, 1, 6 ],
#             [ 8, 11, 0, 0, 0, 0, 1, 0, 7 ],
#             [ 0, 0, 2, 0, 0, 0, 6, 7, 0]
# ]
# source = 0

# shortest_distances = dijkstra(graph, source)

# for i, distance in enumerate(shortest_distances):
#     print(f"Shortest distance from {source} to {i} is {distance}")

#O ( V 2 )
def djikstras(graph, source):
    v = len(graph)
    distance = [float('inf')] * v
    visited = [False] * v

    distance[source] = 0

    for _ in range(v-1):
        min_distance = float('inf')
        for i in range(v):
            if not visited[i] and distance[i] < min_distance:
                min_distance = distance[i]
                u = i
        visited[u] = True
        for j in range(v):
            if not visited[j] and graph[u][j] and distance[u] + graph[u][j] < distance[j]:
                distance[j] = distance[u] + graph[u][j]
    return distance

graph = []

n = int(input("Enter no of vertices"))
for i in range(n):
    inp = input()
    graph.append(inp.split())

for element in graph:
    for e in range(n):
        element[e] = int(element[e])

min_distances = djikstras(graph, 1)

print(min_distances)