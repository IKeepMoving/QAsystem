# coding: utf-8

import sys
from autoQA.create.GenerateQt import GenerateQt

def main(path,size=6):
    generateqt=GenerateQt()
    return generateqt.setVar(path,size)
if __name__ == '__main__':
    type_w=sys.argv[1].split('.')
    if type_w[1]=='txt':
        print(main(sys.argv[1],-1))
    else:
        print(main(sys.argv[1]))
