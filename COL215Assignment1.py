def check(term):# checks which rows are valid
    s0={0:{0},1:{1},None:{0,1}}
    s1={0:{0,1},1:{2,3},None:{0,1,2,3}}
    s2={0:{3,0},1:{1,2},None:{0,1,2,3}}
    s=s0[term[0]]
    if(len(term)==2):#checking for more than 2 rows or columns
        s=s1[term[0]]
        s=s.intersection(s2[term[1]])
        if(term==[None,0]):
            s=[3,0]
    return list(s)
def is_legal_region(kmap_function,term):
    y=check(term[:(len(term)+1)//2])#finding the valid columns
    x=check(term[(len(term)+1)//2:])#finding the vaklid rows
    for i in y:
        for j in x:
            if(kmap_function[j][i]==0):#checking if region is legal
                return ((x[0],y[0]),(x[-1],y[-1]),False)
    return ((x[0],y[0]),(x[-1],y[-1]),True)