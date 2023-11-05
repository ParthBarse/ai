def selection_sort(n):
    for i in range(len(n)):
        min_ind = i
        for j in range(i+1, len(n)):
            if n[j] < n[min_ind]:
                min_ind = j
        n[i], n[min_ind] = n[min_ind], n[i]
    return n

# Time Complexity - O(n2)

n = [34, 45, 12, 56, 1, 8]
sorted_array = selection_sort(n)
print(sorted_array)

# graph = [
#     [0, 4, 3, 0, 5],
#     [4, 0, 1, 7, 0],
#     [3, 1, 0, 4, 0],
#     [0, 7, 4, 0, 2],
#     [5, 0, 0, 2, 0]
# ]
# print(graph)



#O(V2)

graph=[]
v=int(input("no of vertices:"))
for i in range(v):
    neighbors = input( )
    neighbors = neighbors.split()
    graph.append(neighbors)

for element in graph:
    for j in range(v):
        element[j]=int(element[j])
        
v = len(graph)

visited = [0]*v

no_edge = 0
visited[0] = True

while (no_edge < v-1):
    min = float("inf")
    x = y = 0
    for i in range(v):
        if visited[i]:
            for j in range(v):
                if ((not visited[j] and graph[i][j])):
                    if graph[i][j] < min:
                        min = graph[i][j]
                        x, y = i, j
    print(f"{x} - {y} :{graph[x][y]}")
    visited[y] = True
    no_edge += 1

'''
0  4  3  0  5
4  0  1  7  0
3  1  0  4  0
0  7  4  0  2
5  0  0  2  0
'''
