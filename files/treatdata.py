#!/usr/bin/env python3
import sys

def strip(line):
    res = list()
    res.append("")
    (in_single,in_double,escaped)=(0,0,0)

    for c in line:
        if c=='\n':
            if not (len(res[0])):
                res[0]="NULL"
            break
        elif c=='\\' and escaped==0:
            escaped=1
            continue
        elif in_single:
            if c=='\'' and escaped==0:
                in_single=0
            else:
                res[0]+=c
        elif in_double:
            if c=='"' and escaped==0:
                in_double=0
            else:
                res[0]+=c
        else:
            if c=='\'':
                in_single=1
            elif c=='"':
                in_double=1
            elif c==',':
                if not (len(res[0])):
                    res[0]="NULL"
                res.insert(0,"")
            else:
                res[0]+=c
        escaped=0
    res.reverse()
    return res

def clean(elts):
    res = list()
    for s in elts:
        res.append(encapsulate(escape_single(escape_backslash(s))))
    return res

def escape_single(s):
    return s.replace("'","\\'")

def escape_backslash(s):
    return s.replace("\\","\\\\")

def encapsulate(s):
    if s=="NULL":
        return s
    try:
        float(s)
        return s
    except ValueError:
        return "'"+s+"'"

def strip_and_clean():
    lines = sys.stdin.readlines()
    for line in lines[1:]:
        elts=clean(strip(line))
        print(','.join(map(str,elts)))

def test():
    print("test")

actions = {
        "test": test,
        "strip-and-clean": strip_and_clean
        }

if __name__=='__main__':
    if (len(sys.argv)<2):
        print("Syntax: "+sys.argv[0]+" --action")
        sys.exit(1)
    action=sys.argv[1].replace("--","",1)
    if action in actions:
        actions[action]()
    else:
        print("Unknown action : "+str(action))
