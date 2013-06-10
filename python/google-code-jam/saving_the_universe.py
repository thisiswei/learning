
if __name__ == '__main__':
    N = int(raw_input())
    for test in range(N):
        engines, queries= [], []
        [engines.append(raw_input()) for i in range(int(raw_input()))]
        [queries.append(raw_input()) for q in range(int(raw_input()))]
        if len(engines) > len(set(queries)): 
            print 'Case #%d: %d' % (test+1, 0)
            continue
        explored = set()
        res = 0
        L = len(engines)
        for q in queries: 
            explored.add(q)
            if len(explored) == L:
                res += 1 
                explored = set([q])
        print 'Case #%d: %d' % (test+1, res)

                   


"""Input 

Output 
2 5 Yeehaw NSM Dont Ask B9 Googol
10 Yeehaw Yeehaw Googol B9 Googol NSM B9 NSM Dont Ask Googol
5 Yeehaw NSM Dont Ask B9 Googol
7 Googol Dont Ask NSM NSM Yeehaw Yeehaw Googol 
Case #1: 1
Case #2: 0

"""
