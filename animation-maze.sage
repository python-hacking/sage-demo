import sys

"""
Usage: supply the maze structure in the input file (pass file's name as an argument) or stdin.
"""
def square(i, j, color):
    x, y = j, -i
    points = [ (x, y), (x + 1, y), (x + 1, y - 1), (x, y - 1) ]
    return polygon(points, color = color)

def valid(i, j):
    return i >= 0 and j >= 0 and i < lab_h and j < lab_w

def neighbours(i, j):
    delta = [(-1, 0), (+1, 0), (0, -1), (0, +1)]
    return [(i+di, j+dj) for di,dj in delta if valid(i+di, j+dj)]

def dfs(i, j, visited, animation):
    global g
    visited.add((i, j))
    if (i, j) == (lab_h - 1, lab_w - 1):
        animation += [g + square(i, j, 'red')]
    if (lab_h - 1, lab_w - 1) in visited: return
    g += square(i, j, 'pink')
    animation += [g]
    for ii,jj in neighbours(i, j):
        if lab[ii][jj] == "." and not (ii, jj) in visited:
            dfs(ii, jj, visited, animation)

inp = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
g = Graphics()
line_no = 0
lab = []
for line in inp:
    lab += [line[:-1]]
    for col_no in range(len(line) - 1):
        if line[col_no] != '.':
            g += square(line_no, col_no, 'gray')
    line_no += 1

lab_h = len(lab)
lab_w = len(lab[0])
frames = [g]

dfs(0, 0, set(), frames)
for f in frames:
    f.axes(False)
    f.xmin(0)
    f.ymax(0)
    f.xmax(lab_w)
    f.ymin(-lab_h)
animate(frames).show(delay=20)
