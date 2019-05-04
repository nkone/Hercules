# -*- coding: UTF-8 -*-

import  sys

def progressbar(idx, prefix="", size=60, file=sys.stdout):
    count = len(idx);
    def show(j):
        x = int(size*j/count);
        file.write("%s[%s%s] %i/%i\r" % (prefix, "🐮"*x, "🌱"*(size-x), j, count))
        file.flush()
    show(0)
    for i, item in enumerate(idx):
        yield item
        show(i+1)
    file.write("\n")
    file.flush()

