def convert(string):# converts the term given as a string to a list of litersls O(l)
    term=[]
    c=""
    for e in string:
        if(e.isalpha()):
            term.append(c)
            c=""
        c+=e
    return term[1:]+[c]
def equal(l1,l2):# checks weather two terms are equal or not O(l)
    for i in range(len(l1)):
        if(l1[i]!=l2[i]):
            return False
    return True
def remove_repeat(l):#removes repeating elements from a list O(nl)
    final=[]
    for i in range(len(l)):
        check=True
        for j in range(i+1,len(l)):
            if(equal(l[i][0],l[j][0])):
                check=False
                break
        if(check):
            final.append(l[i])
    return final
def inside(term,region):# checks if a given term lies inside a region or not O(l)
    for i in range(len(term)):
        if(region[i]!=term[i] and region[i]!=None):
            return False
    return True
def intersection(l1,l2,grid):#checks if intersection of two regions is non_empty O(nl)
    for e in grid:
        if(inside(convert(e),l1) and inside(convert(e),l2)):
            return True
    return False
def convert_back(l):# converts a term from list to string form O(l)
    s=""
    for e in l:
        if(e!=None):
            s+=e
    return s
def elements_inside(region,grid):# returns the list of indices of elements of grid which are inside the region O(nl)
    terms_in_region=[]
    for i in range(len(grid)):
        if(inside(convert(grid[i]),region)):
            terms_in_region.append(i)
    return terms_in_region
def maximal(term,grid,n,j,k):# finds the biggest possible legal region containing the given term, the log of size of region and also the indices of elements in the region O(n*2^l) as it checks for all 2^l possible terms individually and uses elements inside function which takes proportional to n time
    maximum=[term,n,j]
    for i in range(len(term)):
        if(term[i]!=None):    
            new_term=term[:i]+[None]+term[i+1:]
            terms=elements_inside(new_term,grid)
            if(len(terms)==2**(n+1)):
                s=maximal(new_term,grid,n+1,terms,k)
                if(s[1]>maximum[1]):
                    maximum=s
    return maximum
def comb_function_expansion(func_TRUE, func_DC):# finds the list of maximally expanded region for each varriable O(n^2*2^l)as it runs maximal n times
    grid=func_TRUE+func_DC
    n=len(func_TRUE)
    final=[]
    for i in range(n):
        region=maximal(convert(func_TRUE[i]),grid,0,[i],n)
        final.append(region)
    return remove_repeat(final)
def opt_function_reduce(func_TRUE,func_DC):# deletes the regions which are contained inside other regions O(n^2*2^l) as it runs comb_function_expansion once and the other expression amount to O(l*n^2)
    l=comb_function_expansion(func_TRUE, func_DC)
    lis=[]
    n=len(func_TRUE)
    c=[0]*n
    ans=[]
    for i in range(len(l)):
        lis.append(l[i][2])
        ans.append(l[i][0])
        for e in lis[i]:
            if(e<n):
                c[e]+=1
    k=1
    print("N="+str(len(convert(func_TRUE[0]))))
    for i in range(len(l)):
        check=True
        for e in lis[i]:
            if(e<n):
                if(c[e]<=1):
                    check=False
        if(check):
            print("Term "+str(k)+": "+convert_back(l[i][0]))
            ans.remove(l[i][0])
            k+=1
            print("Covering region:",end=" ")
            for e in ans:
                if(intersection(l[i][0],e,func_DC+func_TRUE)):
                    print(convert_back(e),end="   ")
            print()
            print()
            for e in lis[i]:
                if(e<n):
                    c[e]-=1
    return [convert_back(e) for e in ans]
