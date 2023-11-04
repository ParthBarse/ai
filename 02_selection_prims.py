def selection_sort(n):
    for i in range(len(n)):
        min_ind = i
        for j in range(i+1, len(n)):
            if n[j] < n[min_ind]:
                min_ind = j
        n[i], n[min_ind] = n[min_ind], n[i]
    return n

n = [34, 45, 12, 56, 1, 8]
sorted_array = selection_sort(n)
print(sorted_array)

def prim_mst(graph):
    V = len(graph)  
    parent = [-1] * V
    key = [float('inf')] * V
    key[0] = 0  
    visited = [False] * V  

    print("--------------------------")
    print("Initialization :- ")
    print("key : ",key)
    print("Parent : ", parent)
    print("--------------------------\n\n")

    for _ in range(V):  
        min_value = float('inf')  
        min_index = -1

        for v in range(V):
            if key[v] < min_value and not visited[v]:
                min_value = key[v]
                min_index = v

        u = min_index
        visited[u] = True  

        for v in range(V):
            if graph[u][v] and not visited[v] and graph[u][v] < key[v]:
                key[v] = graph[u][v]  
                parent[v] = u  

    print("Edge \tWeight")
    for i in range(1, V):
        print(parent[i], "-", i, "\t", graph[parent[i]][i])

graph = [
    [0, 2, 0, 6, 0],
    [2, 0, 3, 8, 5],
    [0, 3, 0, 0, 7],
    [6, 8, 0, 0, 9],
    [0, 5, 7, 9, 0]
]

prim_mst(graph)


# class Graph:
#     def __init__(self, vertices):
#         self.V = vertices
#         self.graph = [[0 for _ in range(vertices)] for _ in range(vertices)]

#     def add_edge(self, u, v, weight):
#         self.graph[u][v] = weight
#         self.graph[v][u] = weight

#     def min_key(self, key, visited):
#         min_value = float('inf')
#         min_index = -1
#         for v in range(self.V):
#             if key[v] < min_value and not visited[v]:
#                 min_value = key[v]
#                 min_index = v
#         return min_index

#     def prim_mst(self):
#         key = [float('inf')] * self.V
#         parent = [-1] * self.V
#         key[0] = 0
#         visited = [False] * self.V

#         for _ in range(self.V):
#             u = self.min_key(key, visited)
#             visited[u] = True

#             for v in range(self.V):
#                 if self.graph[u][v] > 0 and not visited[v] and self.graph[u][v] < key[v]:
#                     key[v] = self.graph[u][v]
#                     parent[v] = u

#         print("Edge\tWeight")
#         for i in range(1, self.V):
#             print(parent[i], "-", i, "\t", self.graph[i][parent[i]])

# # Create a graph with 5 vertices
# g = Graph(5)

# # Add different edges to the graph
# g.add_edge(0, 1, 4)
# g.add_edge(0, 2, 3)
# g.add_edge(1, 2, 1)
# g.add_edge(1, 3, 7)
# g.add_edge(2, 3, 4)
# g.add_edge(3, 4, 2)
# g.add_edge(4, 0, 5)

# # Find and print the MST
# g.prim_mst()
