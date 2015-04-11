from Queue import Queue

def my_plot(graph, done, queued = [], cur_path = [], vert = None):
    s = set([vert]) if vert != None else set()
    vertex_colors = {'white': set(graph.vertices()) - set(queued) - s - set(done),
                     'gray': done,
                     'yellow': set(queued) - s - set(done),
                     'pink': s}
    edge_colors = {'black' : set(g.edges(false)) - set(cur_path), 'blue': cur_path}
    plot = g.plot(layout="circular", vertex_colors=vertex_colors, edge_colors=edge_colors)
    return plot

def bfs(graph, frm, to):
    if frm == to:
        return [my_plot(graph, [], [], [], frm), my_plot(graph, [frm], [], [])]
    queue = Queue()
    animation = []
    pred = {frm: None} # also acts as the 'visited' set
    queue.put(frm)
    done = []
    while not queue.empty():
        current = queue.get()
        animation += [my_plot(graph, done, list(pred), [], current)]
        for v in graph.neighbors(current):
            if not v in pred:
                queue.put(v)
                pred[v] = current
                animation += [my_plot(graph, done, list(pred), [], current)]
                if v == to:
                    path = []
                    while v != None:
                        path += [v]
                        v = pred[v]
                    path.reverse()
                    animation += [my_plot(graph, done, list(pred), [(i,j) for i,j in zip([None] + path, path + [None])[1:-1]]) ]
                    return animation
        done += [current]
    return animation

adj_lists = {0: [1,4,5], 1: [2,6], 2: [3,7], 3: [4,8], 4: [9], 5: [7, 8], 6: [8,9], 7: [9], 8: [10, 11], 10: [12] }
g = Graph(adj_lists)
animate(bfs(g, 0, 12)).show(delay=66)
