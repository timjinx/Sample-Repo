def findOutlier(integers):
    ofound = 0
    efound = 0
    ocnt = 0
    ecnt = 0
    for el in integers:
        if (el % 2 == 1):
            ofound = el
            ocnt = ocnt + 1
        else:
            efound = el
            ecnt = ecnt + 1
    return(efound if ocnt > ecnt else ofound)


print("The outlier is %s" % findOutlier([1, 6, 3, 5, 7]))
print("The outlier is %s" % findOutlier([2, 6, 34, 5, 8]))
