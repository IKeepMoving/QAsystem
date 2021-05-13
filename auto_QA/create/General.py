# coding: utf-8

class General(object):
    def __init__(self):
        self.ltp_list=None
    def setLtp(self,ltp):
        self.ltp_list=ltp
        self.generateQt()
    def generateQt(self):
        #生成一般疑问句
        for sent_obj in self.ltp_list:
            if sent_obj.Gflag==False:
                qt=''
                quest=[]
                count=0
                if sent_obj.sub[0]!=-1:
                    qt=qt+sent_obj.sub[1]
                    count=count+1
                qt=qt+'是否'
                quest.append('is')
                if sent_obj.pre[0]!=-1:
                    qt=qt+sent_obj.pre[1]
                    count=count+1
                if sent_obj.obj[0]!=-1:
                    qt=qt+sent_obj.obj[1]
                    count=count+1
                qt=qt+'?'
                if qt not in sent_obj.question and count>1:
                    quest.append(qt)
                    sent_obj.question.append(quest)
                    sent_obj.Gflag=True