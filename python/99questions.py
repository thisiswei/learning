def flatten(lst):
    def aux(lst):
        for i in lst:
            if isinstance(i, list):
                for q in aux(i):
                    yield q 
            else:
                yield i
    return list(aux(lst))

def flatten2(lst):
    return list(chain(*lst)) # only gonna work for [[a,b], [c,d]] not [a, [c,d]]


#Problem 8: Eliminate consecutive duplicates of list elements
def remove_dups(lst):
    prev = ""
    result = []
    for l in lst:
        if l != prev:
            result.append(l)
        prev = l
    return result

#from itertools import groupby 
def remove_dups_short(lst): 
    return [key for key, group in groupby(lst)]

#9
#Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.

def into_sublist(lst): 
    return [list(group) for key, group in groupby(lst)]

#10
#encode "aaaabccaadeeee"
#[(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
def encode(lst):
    return map(lambda l: [len(l), l[0]], into_sublist(lst))


#11
#* (encode-modified '(a a a a b c c a a d e e e e))
#((4 A) B (2 C) (2 A) D (4 E))

def encode_modified(lst):
    return [[cnt, e] if cnt > 1 else e for cnt,e in encode(lst)]


#12
#decode #11

#    [[2, "a"], [2, "b"], "f", 6, 7, 5, [2, "h"]]
# => 


#15
#* (repli '(a b c) 3)
#(A A A B B B C C C)
def repli(lst, ntimes):
    return [e for e in lst for i in range(ntimes)]


#16
#* (drop '(a b c d e f g h i k) 3)
#(A B D E G H K)

def drop(lst, n):
    result = []
    for i in range(len(lst)):
        if (i+1) % n != 0:
            result.append(lst[i])
    return result

def drop_shorter(lst, n):
    return [e for i, e in enumerate(lst) if (i+1) % n]

#17
#* (split '(a b c d e f g h i k) 3)
#( (A B C) (D E F G H I K))

def split(lst, index):
    return [lst[:index], lst[index:]]


#19 Rotate a list N places to the left.
#* (rotate '(a b c d e f g h) 3)
#(D E F G H A B C) 
#* (rotate '(a b c d e f g h) -2)
#(G H A B C D E F)

def rotate(lst, n):
    return lst[n:] + lst[:n]


#20
# remove the kth element from the a list
def remove_k(lst, k):
    lst.pop(k-1)
    return lst


#21
#Insert an element at a given position into a list.
def insert_at(lst, elem, k):
    return lst[:k] + [elem] + lst[k:]


#22
#Create a list containing all integers within a given range.
def my_range(start, end):
    if end - start == 1:
        return [start, end]
    return [start] + my_range(start+1, end)

#23 randomly extract a given number elements
import random
def rn_select(lst, n):
    return [random.choice(lst) for _ in range(n)] # not unique
    # return random.sample(lst, n)

#27
#In how many ways can a group of 9 people work in 3 disjoint subgroups of 
 # 2, 3 and 4 persons? 
def removed(lst, elems):
    s = set(lst)
    for e in elems:
        s.remove(e)
    return list(s)

def combos(lst, n):
    return [itertools.combinations(lst, n)]

def group(lst, cnt):
    x, y, z = cnt
    [[i, [j for j in combos(removed(lst,i), y)]] for i in combos(lst,x)]
# need more work     


#32 greatest common divisor

def comdivior(x, y):
    while y != 0:
        x, y = y, x%y
    return x

