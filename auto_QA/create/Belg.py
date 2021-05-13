# coding: utf-8

from collections import Counter
import os

class Belg(object):
    def __init__(self):
        self.ltp_list=None
        
        self.list_have=[]
        self.list_obj=[]
        self.list_under=[]
        self.list_unit=[]
        
        self.initSimilar()
    
    def setLtp(self,ltp):
        self.ltp_list=ltp
        self.generateQt()
    #问题产生
    def generateQt(self):
        for sent_obj in self.ltp_list:
            if sent_obj.Gflag==False:
                qt=""
                quest=[]
                self.countWeight(sent_obj)
                
                #优化-------------------------各部分所占比重
                if sent_obj.weight>=0.4 and (sent_obj.pre[0]!=-1 or sent_obj.zwb_obj[0]!=-1 or sent_obj.zwb_unit[0]!=-1):
                    if sent_obj.sub[0]!=-1:
                        qt=qt+sent_obj.sub[1]
                    qt=qt+'的'
                    if sent_obj.zwb_obj[0]!=-1:
                        qt=qt+sent_obj.zwb_obj[1]
                    quest.append('which')
                    qt=qt+'有哪些？'
                elif sent_obj.zwb_unit[0]!=-1:
                    if sent_obj.sub[0]!=-1:
                        qt=qt+sent_obj.sub[1]
                    if sent_obj.pre[0]!=-1:
                        qt=qt+sent_obj.pre[1]
                    quest.append('which')
                    qt=qt+'多少'+sent_obj.zwb_unit[1]+'?'
                    
                for un in self.list_under:
                    qt=qt.replace(un,'')
                if qt!='' and qt not in sent_obj.question:
                    sent_obj.Gflag=True
                    quest.append(qt)
                    sent_obj.question.append(quest)

    #权重计算
    def countWeight(self,sent_obj):
        temp=[]
        for i in range(len(sent_obj.analysis)):
            #谓语是否在同义词林中（支持，有，包括 ...）
            if sent_obj.analysis[i][0] in self.list_have:
                sent_obj.weight=sent_obj.weight+0.2
                continue
            #提问对象是什么，是否在同义词林中
            if sent_obj.analysis[i][0] in self.list_obj:
                #Desc 
                if sent_obj.analysis[i-1][4]=='Desc' and sent_obj.analysis[i-1][3]==i:
                    sent_obj.zwb_obj[1]=sent_obj.zwb_obj[1]+sent_obj.analysis[i-1][0]
                sent_obj.zwb_obj[1]=sent_obj.zwb_obj[1]+sent_obj.analysis[i][0]
                sent_obj.zwb_obj[0]=i
                sent_obj.weight=sent_obj.weight+0.2
                continue
            #‘以下’、'如下'.....
            if sent_obj.analysis[i][0] in self.list_under:
                sent_obj.weight=sent_obj.weight+0.1
                continue

            #‘：’ ‘、’
            if sent_obj.analysis[i][0]=='、':
                sent_obj.weight=sent_obj.weight+0.05
            if sent_obj.analysis[i][0]=='：' or sent_obj.analysis[i][0]==':':
                sent_obj.weight=sent_obj.weight+0.1
                continue
            #Qp、quan或者数字+种是否在句子中
            if sent_obj.analysis[i][4]=='Quan':
                sent_obj.weight=sent_obj.weight+0.1
            elif sent_obj.analysis[i][4]=='Qp':# or self.sdp_list[i][0] in self.list_unit:
                sent_obj.weight=sent_obj.weight+0.1
                temp.append(sent_obj.analysis[i][0])
        #出现次数最多的单位
        if temp:
            sent_obj.zwb_unit[0]=1
            sent_obj.zwb_unit[1]=list(Counter(temp).most_common(1)[0])[0]

    #-----------endcountWeight

    #得到同义词林
    def initSimilar(self):
        similar_path=os.path.dirname(os.path.realpath(__file__))
        with open(os.path.join(similar_path, 'similar_have.txt'),'r') as f:
            similar_have=f.read()
        self.list_have=similar_have.split(' ')
        self.list_have[-1]=self.list_have[-1].replace('\n','')

        with open(os.path.join(similar_path, 'similar_obj.txt'),'r') as f:
            similar_obj=f.read()
        self.list_obj=similar_obj.split(' ')
        self.list_obj[-1]=self.list_obj[-1].replace('\n','')

        with open(os.path.join(similar_path, 'similar_under.txt'),'r') as f:
            similar_under=f.read()
        self.list_under=similar_under.split(' ')
        self.list_under[-1]=self.list_under[-1].replace('\n','')
        
        with open(os.path.join(similar_path, 'similar_unit.txt'),'r') as f:
            similar_unit=f.read()
        self.list_unit=similar_unit.split(' ')
        self.list_unit[-1]=self.list_unit[-1].replace('\n','')
