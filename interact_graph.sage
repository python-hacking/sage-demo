@interact
def f(n=slider([0..10], default=3)):
    gg = [graphs.CompleteGraph(i) for i in range(n)]
    a = animate(gg)
    a.show(delay=20)
