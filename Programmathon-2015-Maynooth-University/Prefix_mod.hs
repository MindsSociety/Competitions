import sys

def prefix_eval(tokens):
    stack = []
    for t in reversed(tokens):
        if   t == '+': stack[-2:] = [stack[-1] + stack[-2]]
        elif t == '-': stack[-2:] = [stack[-1] - stack[-2]]
        elif t == '*': stack[-2:] = [stack[-1] * stack[-2]]
        elif t == '/': stack[-2:] = [stack[-1] / stack[-2]]
        else: stack.append(int(t))
    return stack[0]

def f(str):
    xs = str.split()

    return prefix_eval(xs[1:]) % int(xs[0])


raw_input()

for line in sys.stdin:
    print f(line)
