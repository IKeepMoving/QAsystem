
# coding: utf-8

# #删除列表所有空元素<br>
# while '' in list:<br>
#     list.remove('')<br>

# In[1]:


from autoQA.utils.LtpAPI import *


# In[2]:


from .WhQT import WhQT


# In[3]:


from .Belg import Belg


# In[4]:


from autoQA.utils.Extractor import Extractor


# In[5]:


from autoQA.utils.ExtractSent import ExtractSent

from autoQA.utils.txt_ExtractSent import txt_ExtractSent


# In[6]:


from .General import General


# In[7]:


from autoQA.utils.SqlUtil import SqlUtil
from autoQA.utils.textrank4zh import TextRank4Keyword, TextRank4Sentence

# In[8]:


class GenerateQt(object):
    def __init__(self):
        self.ltp_list=None
        self.count=None
        self.ext = Extractor()
        self.exs=ExtractSent()
        self.txtexs=txt_ExtractSent()
        self.whqt=WhQT()
        self.belg=Belg()
        self.general=General()
        self.sqlutil=SqlUtil()
        self.tr4w = TextRank4Keyword()
    def setVar(self,path,size=6):
        self.count=0
        if size<0:
            article=None
            with open(path,'r') as f:
                article=f.read()
            article=article.replace('我国','中国')
            art_list=article.split('\n')
            self.ltp_list = self.txtexs.setVar(art_list)
        else:
            art_list = self.ext.setVar(path,size)
            self.ltp_list = self.exs.setVar(art_list)
        if self.ltp_list:
            start_Analysis(self.ltp_list)
            extractSpo(self.ltp_list)
            self.createQt()
        #print('generate',self.count)
        return self.count
    
    def createQt(self):
        self.whqt.setLtp(self.ltp_list)
        if self.hasSent():
            self.belg.setLtp(self.ltp_list)
        if self.hasSent():
            self.general.setLtp(self.ltp_list)
        if self.hasSent():
            pass
        
    def cutText(self,text):  
        list_text=[]
        self.tr4w.analyze(text=text, lower=True, window=2)
        for item in self.tr4w.get_keywords(3, word_min_len=1):
            list_text.append(item.word)
        return list_text
    #判断是否有句子未生成问题，并将已生成问题的句子删除
    def hasSent(self):
        de=[]
        for sent_obj in self.ltp_list:
            if sent_obj.Gflag:
                list_text=[]
                list_text+=self.cutText(sent_obj.sub[1])
                list_text+=self.cutText(sent_obj.pre[1])
                list_text+=self.cutText(sent_obj.obj[1])
                sent_obj.keyqt="-".join(list_text)
#                 print(sent_obj.centerSent,sent_obj.para,sent_obj.question,sent_obj.keyqt)
                self.count+=self.sqlutil.isExist(sent_obj)
                de.append(sent_obj)
        for sent in de:
            self.ltp_list.remove(sent)
        if self.ltp_list:
            return True
        else:
            self.sqlutil.close()
            return False