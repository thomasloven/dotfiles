#!/usr/bin/env python

from sys import stdin,stdout
import sys
import re
import getopt

try:
    opts,args = getopt.getopt(sys.argv[1:], "ts:")
except getopt.GetoptError as err:
    print str(err)
    print("Argument error")
    sys.exit(2)

splitchar='\t'

for o,a in opts:
    if o == "-s":
        splitchar = a


lines = []
clines = []
p = re.compile("\x1b[^m]m");
for line in stdin:
    items = line.rstrip().split(splitchar)
    lines.append(items)
    items2 = [re.sub("\x1b\[[0-9;]*m", "", i) for i in items]
    clines.append(items2)
    counts = [len(i) for i in items2]
    if 'lengths' in locals():
        counts += [0]*(len(lengths)-len(counts))
        lengths = map(max,zip(lengths, counts))
    else:
        lengths = counts


lt = 0
for l in lines:
    it = 0
    for i in l[:-1]:
        print i, ' '*(lengths[it]-len(clines[lt][it])),
        it = it+1
    print l[-1]
    lt = lt+1
