# coding: utf-8

class WhQT(object):
    def __init__(self):
        
        self.ltp_list=None
    
    def setLtp(self,ltp):
        self.ltp_list=ltp
        self.generateQt()


        
    def generateQt(self):
        for sent_obj in self.ltp_list:
            
            if sent_obj.Gflag==False:
                sent=''
                head_number=-1
                for i in sent_obj.analysis:
                    sent=sent+i[0]
                    if i[4]=='Root':
                        head_number=i
                if sent_obj.analysis[len(sent_obj.analysis)-1][1]=='wp':
                    sent=sent[0:-1]
                for i in range(len(sent_obj.analysis)):
                    if sent_obj.analysis[i][4]=='Clas':
                        qt=''
                        quest=[]
                        #if self.haveTag(sent_obj.sub[0],'nh',sent_obj.analysis):
                        #    qt=sent_obj.sub[1]+'是谁？'
                        #    quest.append('who')
                        if self.haveTag(sent_obj.sub[0],'nt',sent_obj.analysis) or self.haveTag(sent_obj.sub[0],'ns',sent_obj.analysis) or self.haveTag(sent_obj.sub[0],'nh',sent_obj.analysis):
                            wh=sent_obj.centerSent.split(sent_obj.pre[1])
                            qt='什么是'+wh[1]+'？'
                            quest.append('what')
                        else:
                            qt=sent_obj.sub[1]+'是什么？'
                            quest.append('what')
                        if qt!='' and qt not in sent_obj.question:
                            sent_obj.Gflag=True
                            quest.append(qt)
                            sent_obj.question.append(quest)
                        continue
                    if sent_obj.analysis[i][4]=='Time' or sent_obj.analysis[i][4]=='Tini':
                        if self.haveTag(i,'nt',sent_obj.analysis):
                            qt=''
                            quest=[]
                            qt=sent.replace(self.extract(i,sent_obj.analysis),'什么时候')+'？'
                            quest.append('when')
                            if qt!='' and qt not in sent_obj.question:
                                sent_obj.Gflag=True
                                quest.append(qt)
                                sent_obj.question.append(quest)
                        continue
                    if sent_obj.analysis[i][4]=='Loc':
                        if self.haveTag(i,'ns',sent_obj.analysis):
                            qt=''
                            quest=[]
                            qt=sent.replace(self.extract(i,sent_obj.analysis),'哪里')+'？'
                            quest.append('where')
                            if qt!='' and qt not in sent_obj.question:
                                sent_obj.Gflag=True
                                quest.append(qt)
                                sent_obj.question.append(quest)
                        continue

    def haveTag(self,head_number,tag,analysis):
        flag=False
        if tag in analysis[head_number][1]:
            flag=True
            return flag
        de=[]
        de.append(head_number)
        while len(de)!=0:
            for j in range(len(analysis)):
                if analysis[j][3]==de[0]:
                    if tag in analysis[j][1]:
                        flag=True
                        break
                    de.append(j)
            de.pop(0)
        return flag
    
    #遍历出此节点下的节点
    def extract(self,head_number,analysis):
        de=[]
        num=[head_number]
        add=''
        de.append(head_number)
        while len(de)!=0:
            for j in range(len(analysis)):
                if analysis[j][3]==de[0]:
                    num.append(j)
                    de.append(j)
            de.pop(0)
        num.sort()
        #将遍历到的节点按照原句顺序组合
        for n in num:
            add=add+analysis[n][0]
        return add
