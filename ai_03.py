#O(E logE) or O(V logV

def selection_sort(n):
    for i in range(len(n)):
        min_ind = i
        for j in range(i+1, len(n)):
            if n[j] < n[min_ind]:
                min_ind = j
        n[i], n[min_ind] = n[min_ind], n[i]
    return n


def kruskal_mst(graph):
    n = len(graph)
    mst = []  # List to store the minimal spanning tree
    edges = []  # List to store all the edges

    # Create a list of edges with their corresponding weights
    for i in range(n):
        for j in range(i + 1, n):
            if graph[i][j] != 0:
                edges.append((i, j, graph[i][j]))

    # Sort the edges by their weights in ascending order
    def get_weight(edge):
        return edge[2]
    edges.sort(key=get_weight)

    parent = list(range(n))

    def find(v):
        if parent[v] == v:
            return v
        return find(parent[v])

    def union(v1, v2):
        root1 = find(v1)
        root2 = find(v2)
        parent[root1] = root2

    # Add edges to the MST, ensuring no cycles are formed
    for edge in edges:
        u, v, weight = edge
        if find(u) != find(v):
            mst.append((u, v, weight))
            union(u, v)

    return mst

# Example usage:
graph = [
    [0, 2, 0, 6, 0],
    [2, 0, 3, 8, 5],
    [0, 3, 0, 0, 7],
    [6, 8, 0, 0, 9],
    [0, 5, 7, 9, 0]
]

minimal_spanning_tree = kruskal_mst(graph)
for u, v, weight in minimal_spanning_tree:
    print(f"Edge ({u}-{v}) with weight {weight}")
