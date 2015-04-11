def my_plot(graph, visited = [], cur_path = []):
    vertex_colors = {'white': list(set(graph.vertices()) - set(visited)), 'gray': visited}
    edge_colors = {'black' : list(set(g.edges()) - set(cur_path)), 'blue': cur_path}
    plot = g.plot(vertex_colors=vertex_colors, edge_colors=edge_colors)
    plot.show()

adj_lists = {0: [1,4,5], 1: [2,6], 2: [3,7], 3: [4,8], 4: [9], 5: [7, 8], 6: [8,9], 7: [9]}
g = Graph(adj_lists)
my_plot(g, [1, 2, 3], [g.random_edge()])
