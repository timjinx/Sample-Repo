# return masked string
def maskify(cc):
    cca = list(cc.strip())
    if ( len(cca) > 4 ) :
        for x in range(0, len(cca) - 4) :
            cca[x] = '#'
    return ''.join(cca)

print(maskify("4556364607935616"))
print(maskify("64607935616"))
print(maskify("1"))
print(maskify(""))