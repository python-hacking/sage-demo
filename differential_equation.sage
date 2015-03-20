t = var('t')    
x = function('x',t) 
DE = diff(x, t) + x - 1
DE
DE.op[1]
DE.op[1].operator()
type(DE.op[1].operator())
s = desolve(DE, [x,t])
plot3d(s,[-10,10], [-10,10])
