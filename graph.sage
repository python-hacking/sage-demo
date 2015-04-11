from Queue import Queue

def my_plot(graph, visited = [], cur_path = [], vert = None):
    s = set([vert]) if vert != None else set()
    vertex_colors = {'white': set(graph.vertices()) - set(visited) - s, 'gray': set(visited) - s, 'red': s}
    edge_colors = {'black' : set(g.edges(false)) - set(cur_path), 'blue': cur_path}
    plot = g.plot(layout="circular", vertex_colors=vertex_colors, edge_colors=edge_colors)
    return plot

def bfs(graph, frm, to):
    queue = Queue()
    animation = []
    pred = {frm: None} # also acts as the 'visited' set
    queue.put(frm)
    while not queue.empty():
        current = queue.get()
        animation += [my_plot(graph, list(pred), [], current)]
        for v in graph.neighbors(current):
            if not v in pred:
                queue.put(v)
                pred[v] = current
                if v == to:
                    path = []
                    while v != None:
                        path += [v]
                        v = pred[v]
                    path.reverse()
                    animation += [my_plot(graph, list(pred), [(i,j) for i,j in zip([None] + path, path + [None])[1:-1]]) ]
                    return animation
    return animation

adj_lists = {0: [1,4,5], 1: [2,6], 2: [3,7], 3: [4,8], 4: [9], 5: [7, 8], 6: [8,9], 7: [9], 8: [10, 11], 10: [12] }
g = Graph(adj_lists)

animation = bfs(g, 0, 12)
animate(animation).show(delay=20)
