def convert(string):# converts the term given as a string to a list of litersls
    term=[]
    c=""
    for e in string:
        if(e.isalpha()):
            term.append(c)
            c=""
        c+=e
    return term[1:]+[c]
def inside(term,region):# checks if a given term lies inside a region or not
    for i in range(len(term)):
        if(region[i]!=term[i] and region[i]!=None):
            return False
    return True
def is_legal(region,grid,size):# checks if a given region is legal or not
    terms_in_region=0
    for e in grid:
        if(inside(convert(e),region)):
            terms_in_region+=1
    return terms_in_region==2**size
def maximal(term,grid,n):# finds the biggest possible legal region containing the given term and also the elements added to the term to create the region
    maximum=[term,n,[]]
    for i in range(len(term)):
        if(term[i]!=None):    
            new_term=term[:i]+[None]+term[i+1:]
            if(is_legal(new_term,grid,n+1)):
                s=maximal(new_term,grid,n+1)
                if(s[1]>maximum[1]):
                    maximum=s
    for e in grid:
        if(inside(convert(e),maximum[0]) and not inside(convert(e),term)):
            maximum[2].append(e)
    return maximum
def comb_function_expansion(func_TRUE, func_DC):# find the maximum legal region for each term in kmap mapped to a 1
    grid=func_TRUE+func_DC
    n=len(func_TRUE)
    final=[""]*n
    for i in range(n):
        region=maximal(convert(func_TRUE[i]),grid,0)
        for e in region[0]:
            if(e!=None):
                final[i]+=e
        if(final[i]==""):
            final[i]=None
#        print("N="+str(len(convert(grid[0]))))
#       print("Current term expansion:"+grid[i])
        print("Next Legal Terms for Expansion:"+" ,".join(region[2]))
#        print("Expanded Term:"+final[i])
    return final