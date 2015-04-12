import random
@interact
def random_graph(density=slider(0, step=0.05, stop=1.), seed="Random seed", n=slider([1..20], label="number of vertices")):
    random.seed(seed)
    g = graphs.CompleteGraph(n)
    m = density * n * (n - 1) / 2
    while g.num_edges() > m:
        g.delete_edge(g.edges()[random.randrange(len(g.edges()))])
