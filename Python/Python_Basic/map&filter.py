def add_five(x):
    return x + 5

nums = [11, 22, 33, 44, 55]
result = list(map(add_five, nums))
print(result)

nums = [11, 22, 33, 44, 55]
res = list(filter(lambda x: x%2==0, nums))
print(res)

nums = [1,2,5,8,3,0,7]
res = list( filter(lambda x : x < 5, nums))
print(res)