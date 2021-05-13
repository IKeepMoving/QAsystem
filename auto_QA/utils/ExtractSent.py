import pynlpir
from .LtpAPI import Faq
from .LtpAPI import analysis_api
class ExtractSent(object):
    def __init__(self):
        
        self.article=None
        self.length=None
        self.tp=None
        
    def setVar(self,article):
        self.article=article
        self.length=len(self.article)
        self.tp=[]
        
        pynlpir.open()
        
        self.extTitle(0)
        self.cutParagraph()
        ltp_list=self.extSent()
        pynlpir.close()
        return ltp_list

    #分割段落
    def cutParagraph(self):
        
        for i in range(len(self.tp)):
            if i<len(self.tp)-1:
                self.tp[i].append("".join(self.article[self.tp[i][0]+1:self.tp[i+1][0]]).replace('&gt;','').replace('-',''))
            else:
                self.tp[i].append("".join(self.article[self.tp[i][0]+1:len(self.article)]).replace('&gt;','').replace('-',''))
        
    #获取标题
    def extTitle(self,number):
        i=number
        Fflag=True
        while i<self.length:
            title_weight=0
            title_number=-1
            if self.article[i]!='':
                title_number=i
#                 title_weight=title_weight+0.5
                if self.article[i][-1] in ['？']:
                    title_weight=title_weight-0.5
                for a in self.article[i]:
                    if a in ['；',';','，',',','、','：',':','。','！','!']:
                        title_weight=title_weight-5
                i=i+1
                while i+1<=self.length and self.article[i]=='':
                    title_weight=title_weight+1.5
                    i=i+1
                if title_weight>=1:
                    self.tp.append([title_number,self.article[title_number].replace('&gt;','').replace('-','')])
                    self.extTitle(i)
                    break
                elif number==0 and Fflag:
                    Fflag=False
                    self.tp.append([title_number-1,''])
            else:
                i=i+1
                
    #获取每段的中心句
    #是否为首句0.8，关键字在标题中出现的次数0.1，句子的长度(阙值为100)0.1
    #@tp   处理完成时tp[0]标题的index，tp[1]标题,tp[2]段落分句结果，tp[3]中心句
    def extSent(self):
        for s in self.tp:
            cutsent=[]
            temp=[]
            titlekeys=self.getWords(s[1])
            
            for i in self.cut_sentences(s[2]): 
                cutsent.append(i)
                count=0
                sentkeys=self.getWords(i)
#                 if len(sentkeys)>3:
#                     sentkeys=sentkeys[0:3]
                for sk in sentkeys:
                    for tk in titlekeys:
                        if sk[0]==tk[0]:
                            count+=1
                temp.append(count*0.1)
            s[2]=cutsent
            s.append(temp)
        de=[]
        for t in self.tp:
            for s in range(len(t[2])):
                weight=0
                if len(t[2][s])<=100 and len(t[2][s])>10:
                    weight+=0.1
                else:
                    weight-=0.5
                if s==0:
                    weight+=0.3
                if s==len(t[2])-1:
                    weight+=0.1
                t[3][s]+=weight
            mm=max(t[3])
            if mm<0.3:
                de.append(t)
            
            t[3]=t[2][t[3].index(mm)]
        for d in de:
            self.tp.remove(d)
        #将中心句和段落加入句子类
        ltp_list=[]
        for s in self.tp:
            faq=Faq()
            faq.para="".join(s[2])
            faq.centerSent=s[3]
            ltp_list.append(faq)
        return ltp_list
                
    #中文分句
    def cut_sentences(self,sentence): 
        puns = frozenset(u'。！？；!?;')  
        tmp = [] 
        cut=[]
        for ch in sentence:  
            tmp.append(ch)  
            if puns.__contains__(ch):  
                cut.append(''.join(tmp))  
                tmp = []  
        cut.append(''.join(tmp))  
        return cut
    
    #获取关键词及其比重
    def getWords(self,sent):
        #关键词
        #key_words=[]
        #keys_list=analysis_api("ke",sent).get('data').get('ke')
        #if keys_list:
        #    for keys in keys_list:
        #        if keys.get('socre') and float(keys.get('socre'))>0.5:
        #            temp=[]
        #            temp.append(keys.get('word'))
        #            temp.append(keys.get('score'))
        #            key_words.append(temp)
        key_words = pynlpir.get_key_words(sent, weighted=True)
        return key_words
    
#         def extSent(self):
#         for s in self.tp:
#             cutsent=[]
#             titlekeys=[]
#             titlekeysname=[]
#             tktemp=self.getWords(s[1])
#             for tk in tktemp:
#                 titlekeys.append(tk[1])
#                 titlekeysname.append(tk[0])
#             title_weight=0
#             if len(titlekeys)>3:
#                 titlekeys=titlekeys[0:3]
#                 titlekeysname[0:3]
#             for tk in titlekeys:
#                 title_weight+=tk
#             for i in range(len(titlekeys)):
#                 titlekeys[i]=titlekeys[i]/title_weight
#             for i in self.cut_sentences(s[2]): 
#                 cutsent.append(i)
#                 weight=0
#                 sent_weight=0
#                 count=0
#                 sentkeys=[]
#                 sktemp=self.getWords(i)
#                 for sk in sktemp:
#                     sentkeys.append([sk[0],sk[1]])
#                 if len(sentkeys)>3:
#                     sentkeys=sentkeys[0:3]
#                 for sk in sentkeys:
#                     sent_weight+=sk[1]
#                 for i in range(len(sentkeys)):
#                     sentkeys[i][1]=sentkeys[i][1]/sent_weight
#                 for sk in sentkeys:
#                     if sk[0] in titlekeysname:
#                         count+=1
#                         weight +=sk[1]*titlekeys[titlekeysname.index(sk[0])]
#                 s.append([count,weight])
