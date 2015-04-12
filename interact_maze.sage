import random

@interact
def random_maze_dfs(n=slider([1..20], label="width"), m=slider([1..20], label="height"), seed="Random seed"):
    random.seed(seed)
    lab = maze_gen(int(n), int(m))
    global g
    global lab_h, lab_w
    lab_h, lab_w = m, n
    g = Graphics()
    line_no = 0
    for line in lab:
        for col_no in range(len(line)):
            if line[col_no] != '.':
                g += square(line_no, col_no, 'gray')
        line_no += 1
    frames = [g]
    dfs(lab, 0, 0, (m - 1, n - 1), set(), frames)
    for f in frames:
        f.axes(False)
        f.xmin(0)
        f.ymax(0)
        f.xmax(lab_w)
        f.ymin(-lab_h)
    animate(frames).show(delay=20)

def square(i, j, color):
    x, y = j, -i
    points = [ (x, y), (x + 1, y), (x + 1, y - 1), (x, y - 1) ]
    return polygon(points, color = color)

def valid(i, j):
    global lab_h, lab_w
    return i >= 0 and j >= 0 and i < lab_h and j < lab_w

def neighbours(i, j):
    ans = []
    if valid(i - 1, j): ans += [(i - 1, j)]
    if valid(i + 1, j): ans += [(i + 1, j)]
    if valid(i, j - 1): ans += [(i, j - 1)]
    if valid(i, j + 1): ans += [(i, j + 1)]
    return ans

def dfs(lab, i, j, dest, visited, animation):
    global g
    visited.add((i, j))
    if (i, j) == dest:
        animation += [g + square(i, j, 'red')]
    if dest in visited: return
    g += square(i, j, 'pink')
    animation += [g]
    for ii,jj in neighbours(i, j):
        if lab[ii][jj] == "." and not (ii, jj) in visited:
            dfs(lab, ii, jj, dest, visited, animation)

def maze_gen(N, M): # (c) FrBr George (https://uneex.ru/LecturesCMC/PythonIntro2014/05_ExceptionsGenerators)
    D = (-2,0), (0,2), (2,0), (0,-2)
    Map = {(i,j): 2 - (i % 2 | j % 2) for i in xrange(M) for j in xrange(N)}
    Todo = [(M / int(2) & -2 , N / int(2) & -2)] if random.randrange(2) else [(0, 0), (M - 1, N - 1)]
    for x,y in Todo:
        Map[x,y]=0

    while Todo:
        x,y = Todo.pop(random.randrange(len(Todo)))
        Check = [(dx,dy) for dx,dy in D if 0 <= x+dx < M and 0 <= y+dy < N and Map[x+dx,y+dy]]
        if Check:
            dx,dy = random.choice(Check)
            Todo.extend([(x,y),(x+dx,y+dy)])
            Map[x+dx,y+dy] = Map[x+dx/2,y+dy/2] = 0

    lines = []
    for i in xrange(M):
        lines += ["".join(".#."[Map[i,j]] for j in xrange(N))]
    return lines
