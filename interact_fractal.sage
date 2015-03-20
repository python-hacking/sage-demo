@interact
def mandel_plot(expo = slider(-10,10,0.1,2), \
      formula = ['mandel','ff'],\
      iterations=slider(1,100,1,30), \
      zoom_x = range_slider(-2,2,0.01,(-2,1)), \
      zoom_y = range_slider(-2,2,0.01,(-1.5,1.5))):
    var('z c')
    f(z,c) = z^expo + c
    ff_m = fast_callable(f, vars=[z,c], domain=CDF)

    # messing around with fast_callable
    for i in range(int(iterations)/3):
        f(z,c) = f(z,c)^expo+c
    ff = fast_callable(f, vars=[z,c], domain=CDF)

    def mandel(z):
      c = z
      for i in range(iterations):
         z = ff_m(z,c)
         if abs(z) > 2:
            return z
      return z
    print 'z <- z^%s + c' % expo

    # calling ff three times, otherwise it fast_callable exceeds a recursion limit
    if formula is 'ff':
     func = lambda z: ff(ff(ff(z,z),z),z)
    elif formula is 'mandel':
     func = mandel

    complex_plot(func, zoom_x,zoom_y, plot_points=200, dpi=150).show(frame=True, aspect_ratio=1)   a.show(delay=20)
