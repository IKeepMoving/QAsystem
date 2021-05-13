# -*- coding: utf-8 -*-
import re
import codecs
import string
import urllib.request
from urllib import error
from bs4 import BeautifulSoup
from urllib.parse import quote

# -*- coding: utf-8 -*-
DBUG   = 0

#匹配body标签内的全部内容
reBODY =re.compile( r'<body.*?>([\s\S]*?)<\/body>', re.I)

#. 	匹配除换行符 \n 之外的任何单字符。要匹配 . ，请使用 \. 。
#* 	匹配前面的子表达式零次或多次。要匹配 * 字符，请使用 \*。
#? 	匹配前面的子表达式零次或一次，或指明一个非贪婪限定符。要匹配 ? 字符，请使用 \?。此处为懒惰匹配
reCOMM = r'<!--.*?-->'

#\s 	匹配任何空白字符，包括空格、制表符、换页符等等。等价于 [ \f\n\r\t\v]。
#\S 	匹配任何非空白字符。等价于 [^ \f\n\r\t\v]。
#此处的{0} 为
#print("{0} {1}".format("hello", "world"))  # 设置指定位置
#输出 'hello world'
reTRIM = r'<{0}.*?>([\s\S]*?)<\/{0}>'

#\ 	将下一个字符标记为或特殊字符、或原义字符、或向后引用、或八进制转义符。
#例如， 'n' 匹配字符 'n'。'\n' 匹配换行符。序列 '\\' 匹配 "\"，而 '\(' 则匹配 "("。
reTAG  = r'<[\s\S]*?>|[ \t\r\f\v]'


reIMG  = re.compile(r'<img[\s\S]*?src=[\'|"]([\s\S]*?)[\'|"][\s\S]*?>')

class Extractor():
    def __init__(self):
        self.filepath=None
        self.blockSize=None
        self.timeout=None
        self.rawPage=None   
        self.ctexts=None    
        self.cblocks=None
        
    def setVar(self,filepath='',blockSize=6):#, image=False):
        #self.saveImage = image
        self.filepath= filepath
        self.blockSize=blockSize
        self.rawPage=""
        self.ctexts=[]
        self.cblocks=[]
        return self.getContext()
    def getRawPage(self):
        if self.filepath!='':
            with codecs.open(self.filepath,'r','utf8')as fp:
                text=fp.read()
            return text
#         else:
#             fakeHeaders={'User-Agent':'Mozilla/5.0(WindowsNT6.1;rv:2.0.1)Gecko/20100101Firefox/4.0.1'}
#             self.url=quote(self.url,safe=string.printable) #解决url中的中文乱码问题
#             #time.sleep(random.randint(1,6))
#             request = urllib.request.Request(self.url)
#             response = urllib.request.urlopen(request)
#             #获取挖网页源码
#             text=response.read().decode('utf-8')
#             return text

    def processTags(self):
        #去除注释
        self.body = re.sub(reCOMM, "", self.body)
        #去除js及样式
        self.body = re.sub(reTRIM.format("script"), "" ,re.sub(reTRIM.format("style"), "", self.body))
        # self.body = re.sub(r"[\n]+","\n", re.sub(reTAG, "", self.body))
        #去除所有标签名
        self.body = re.sub(reTAG, "", self.body)

    def processBlocks(self):
        #文本
        self.ctexts   = self.body.split("\n")
        #每行的字数
        self.textLens = []
        #去除单行超长的文本
        de=[]
        for text in self.ctexts:
            length=len(text)
            if length>300:
                de.append(text)
            elif length==0:
                self.textLens.append(length)
            else:
                count=0
                for s in text:
                    if s.isalnum() or s.isalpha():
                        count+=1
                if count/length<0.3 or count/length>0.8:
                    self.textLens.append(length)
                else:
                    de.append(text)
        for d in de:
            self.ctexts.remove(d)
        #list * int 意思是将数组重复 int 次并依次连接形成一个新数组
        self.cblocks  = [0]*(len(self.ctexts) - self.blockSize - 1)
        #文本的字节数
        lines = len(self.ctexts)
        for i in range(self.blockSize):
            #lambda 匿名函数
            self.cblocks = list(map(lambda x,y: x+y, self.textLens[i : lines-1-self.blockSize+i], self.cblocks))
        maxTextLen = max(self.cblocks)
        
        length=len(self.cblocks)
        self.start = self.end = self.cblocks.index(maxTextLen)
        while self.start > 0 and self.cblocks[self.start] > min(self.textLens):
            self.start -= 1
        while self.end<length and self.end < lines - self.blockSize and self.cblocks[self.end] > min(self.textLens):
            self.end += 1
        return self.ctexts[self.start:self.end]
        #return "".join(self.ctexts[self.start:self.end]).replace('&gt;','').replace('-','')

#     def processImages(self):
#         self.body = reIMG.sub(r'{{\1}}', self.body)

    def getContext(self):
        soup=BeautifulSoup(self.getRawPage(),'lxml')
        self.rawPage = soup.prettify()
        self.body = re.findall(reBODY, self.rawPage)[0]
#         if self.saveImage:
#             self.processImages()
        self.processTags()
        return self.processBlocks()
