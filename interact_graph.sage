import random
from Queue import Queue

@interact
def random_graph_bfs(n=slider([1..20], label="number of vertices"), density=slider(0, step=0.05, stop=1.), seed="Random seed"):
    random.seed(seed)
    g = graphs.CompleteGraph(n)
    m = density * n * (n - 1) / 2
    while g.num_edges() > m:
        g.delete_edge(g.edges()[random.randrange(len(g.edges()))])
    animate(bfs(g, 0, g.num_verts() - 1)).show(delay=66)

def my_plot(graph, done, queued = [], cur_path = [], vert = None):
    s = set([vert]) if vert != None else set()
    vertex_colors = {'white': set(graph.vertices()) - set(queued) - s - set(done),
                     'gray': done,
                     'yellow': set(queued) - s - set(done),
                     'pink': s}
    edge_colors = {'black' : set(graph.edges(false)) - set(cur_path), 'blue': cur_path}
    plot = graph.plot(layout="circular", vertex_colors=vertex_colors, edge_colors=edge_colors)
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
