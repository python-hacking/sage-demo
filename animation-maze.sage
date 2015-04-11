import sys

"""
Usage: supply the maze structure in the input file (pass file's name as an argument) or stdin.
"""
def square(i, j):
    x, y = j, -i
    points = [ (x, y), (x + 1, y), (x + 1, y - 1), (x, y - 1) ]
    return polygon(points, rgbcolor = (1/2, 1/2, 1/2))

inp = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
g = Graphics()
line_no = 0
for line in inp:
    line_no += 1
    for col_no in range(len(line) - 1):
        if line[col_no] != '.':
            g += square(line_no, col_no)
g.axes(False)
g.show()
