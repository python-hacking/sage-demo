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
    ans = []
    if valid(i - 1, j): ans += [(i - 1, j)]
    if valid(i + 1, j): ans += [(i + 1, j)]
    if valid(i, j - 1): ans += [(i, j - 1)]
    if valid(i, j + 1): ans += [(i, j + 1)]
    return ans

def dfs(g, i, j, visited, animation):
    if (lab_h - 1, lab_w - 1) in visited: return
    animation += [g + square(i, j, 'pink')]
    visited.add((i, j))
    if (i, j) == (lab_h - 1, lab_w - 1):
        animation += [g + square(i, j, 'red')]
    for ii,jj in neighbours(i, j):
        if lab[ii][jj] == "." and not (ii, jj) in visited:
            dfs(g, ii, jj, visited, animation)

inp = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
g = Graphics()
g.axes(False)
line_no = 0
lab = []
for line in inp:
    lab += [line[:-1]]
    line_no += 1
    for col_no in range(len(line) - 1):
        if line[col_no] != '.':
            g += square(line_no, col_no, 'gray')

lab_h = len(lab)
lab_w = len(lab[0])
frames = [g]
dfs(g, 0, 0, set(), frames)
animate(frames).show(delay=66)
