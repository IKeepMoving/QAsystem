
# coding: utf-8

# In[ ]:


# coding: utf-8

from .LtpAPI import Faq
from autoQA.utils.textrank4zh import TextRank4Keyword, TextRank4Sentence

class txt_ExtractSent(object):
    def __init__(self):
        
        self.article=None
        self.length=None
        self.tp=None
        self.wsp=['；',';','，',',','、','：',':','。','！','!']
        
    def setVar(self,article):
        self.article=article
        self.length=len(self.article)
        self.tp=[]
        
        self.extTitle()
        self.cutParagraph()
        ltp_list=self.extSent()
        return ltp_list

    #分割段落
    def cutParagraph(self):
        
        for i in range(len(self.tp)):
            if i<len(self.tp)-1:
                self.tp[i].append(self.article[self.tp[i][0]+1:self.tp[i+1][0]])
            else:
                self.tp[i].append(self.article[self.tp[i][0]+1:len(self.article)])
        
    #获取标题
    def extTitle(self):
        i=0
        while i<self.length:
            wsp_flag=False
            if self.article[i]!='':
                for w in self.wsp:
                    if w in self.article[i]:
                        wsp_flag=True
                        break
                if not wsp_flag:
                    if self.tp:
                        if self.tp[len(self.tp)-1][0]==i-1:
                            self.tp.pop()
                    self.tp.append([i,self.article[i]])
            i=i+1
    #将中心句和段落加入句子类
    def extSent(self):
        ltp_list=[]
        for s in self.tp:
            for a in s[2]:
                sent=self.get_key_sentences(a)
                if sent!='':
                    faq=Faq()
                    faq.para="".join(a)
                    faq.centerSent=sent
                    faq.title=s[1]
                    ltp_list.append(faq)
        return ltp_list
    
    def get_key_sentences(self,text):
        tr4s = TextRank4Sentence()
        tr4s.analyze(text=text, lower=True, source = 'all_filters')
        sent=tr4s.get_key_sentences(num=1)
        if sent:
            return sent[0].sentence
        else:
            return ''