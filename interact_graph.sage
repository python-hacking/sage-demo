@interact
def f(n=slider([0..10], default=7)):
    gg = [plot(graphs.CompleteGraph(i)) for i in range(n)]
    a = animate(gg)
    a.show(delay=20)
