# '''A':['B','C','D'],'B':['E'],'C':['D','E'],'D':[],'E':[]'''

# Time Complexity - O(V + E)

graph = {}
visited = set()
visit = set()

def dfs(visited, graph, root):
    if root not in visited:
        print(root, end='->')
        visited.add(root)
        for neighbour in graph[root]:
            dfs(visited, graph, neighbour)

def bfs(visited, graph, queue):
    if not queue:
        return

    current_node = queue.pop(0)
    print(current_node, end='->')

    for neighbor in graph[current_node]:
        if neighbor not in visited:
            visited.add(neighbor)
            queue.append(neighbor)

    bfs(visited, graph, queue)

n = int(input("Enter number of nodes: "))
for i in range(n):
    node = input("Node name: ")
    C = input("Enter neighbor nodes: ")
    if C and C != '':
        C = C.split(' ')
        graph[node] = C
    else:
        graph[node] = []

dfs(visited, graph, 'A')
print("\nBFS traversal:")
bfs(visit, graph, ['A'])