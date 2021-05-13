import os
import time
import urllib.request
import urllib.parse
import json
import hashlib
import base64

class Faq(object):
    def __init__(self):
        self.Gflag=False
        self.weight=0
        self.centerSent=''
        self.para=''
        self.sub=[-1,'']
        self.pre=[-1,'']
        self.obj=[-1,'']
        self.zwb_obj=[-1,'']
        self.zwb_unit=[-1,'']
        self.analysis=[]
        self.question=[]
        self.keyqt=''
        self.title=''

def start_Analysis(ltp_list):
    for sent in ltp_list:
    
        #中文分词
        words_list=analysis_api("cws",sent.centerSent).get('data').get('word')

        #去除  目前、当下等 不需要提问的时间词
        similarnow_list=getsimilarNow()
        for word in words_list:
            if word in similarnow_list:
                words_list.remove(word)
        article=''.join(words_list)
        ltp_Analysis(article,sent)

#分析
def ltp_Analysis(article,sent):
    #中文分词
    word=analysis_api("cws",article).get('data').get('word')
    #词性标注
    pos=analysis_api("pos",article).get('data').get('pos')
    #语义依存 (依存树) 分析
    sdp=analysis_api("sdp",article).get('data').get('sdp')
    #语义依存 (依存图) 分析
    sdgp=analysis_api("sdgp",article).get('data').get('sdgp')
    
    i=0
    for w,p,s in zip(word,pos,sdgp):
        temp=[]
        temp.append(word[i])
        temp.append(pos[i])
        temp.append(sdp[i]['relate'])
        temp.append(sdgp[i]['parent'])
        temp.append(sdgp[i]['relate'])
        i=i+1
        sent.analysis.append(temp)

def analysis_api(tpye,article):
    #接口地址
    url ="http://ltpapi.xfyun.cn/v1/"+tpye
    #开放平台应用ID
    x_appid = "5cbe8000"
    #开放平台应用接口秘钥
    api_key = "5ce2756c193ed2bc74e402ca27e91d27"
    #语言文本
    body = urllib.parse.urlencode({'text': article}).encode('utf-8')
    param = {"type": "dependent"}
    x_param = base64.b64encode(json.dumps(param).replace(' ', '').encode('utf-8'))
    x_time = str(int(time.time()))
    x_checksum = hashlib.md5(api_key.encode('utf-8') + str(x_time).encode('utf-8') + x_param).hexdigest()
    x_header = {'X-Appid': x_appid,
                'X-CurTime': x_time,
                'X-Param': x_param,
                'X-CheckSum': x_checksum}
    req = urllib.request.Request(url, body, x_header)
    result = urllib.request.urlopen(req)
    result = result.read()
    return json.loads(result.decode('utf-8'))
        
def extractSpo(ltp_list):
    for sent in ltp_list:
        if sent.analysis:
            #找到Head
            head_number=-1
            for i in range(len(sent.analysis)):
                if sent.analysis[i][4]=="Root":
                    head_number=i
                    break
            #谓语
            sent.pre[0]=head_number
            sent.pre[1]=sent.analysis[head_number][0]

            for j in range(len(sent.analysis)):
                if sent.analysis[j][3]==head_number:
                    #主语
                    if ('Exp' in sent.analysis[j][4]) or ('Aft' in sent.analysis[j][4]) or ('Agt' in sent.analysis[j][4]) or ('Poss' in sent.analysis[j][4]):
                        sent.sub[0]=j
                        sent.sub[1]=j
                    #宾语
                    elif ('Clas' in sent.analysis[j][4]) or ('Pat' in sent.analysis[j][4]) or ('Cont' in sent.analysis[j][4]) or ('Prod' in sent.analysis[j][4]) or ('Orig' in sent.analysis[j][4]):
                        sent.obj[0]=j
                        sent.obj[1]=j
            #未找到主语时，谓语前面的为主语----------------------------------------无主语时用关键词或标题,或者将谓语前的设为主语
            if sent.sub[0]==-1:
                if sent.title!='':
                    sent.sub[1]=sent.title
                else:
                    sent.sub[0]=head_number-1
                    for j in range(head_number):
                        if sent.analysis[j][1]!='wp':
                            sent.sub[1]=sent.sub[1]+sent.analysis[j][0]
            else:
                sent.sub[1]=extract(sent.sub[0],sent.analysis)
            if sent.obj==-1:
                sent.obj[0]=head_number+1
                i=head_number+1
                while i<len(sent.analysis):
                    if sent.analysis[i][1]=='wp':
                        break
                    sent.obj[1]=sent.obj[1]+sent.analysis[i][0]
                    i+=1
            else:
                sent.obj[1]=extract(sent.obj[0],sent.analysis)

            #---------------------------------end>extractSPO
#遍历出此节点下的节点
def extract(head_number,sent_list):
    de=[]
    num=[head_number]
    add=''
    de.append(head_number)
    while len(de)!=0:
        for j in range(len(sent_list)):
            if sent_list[j][3]==de[0]:
                num.append(j)
                de.append(j)
        de.pop(0)
    num.sort()
    #将遍历到的节点按照原句顺序组合
    for n in num:
        add=add+sent_list[n][0]
    return add

def getsimilarNow():
    similar_path=os.path.dirname(os.path.realpath(__file__))
    with open(os.path.join(similar_path, 'similar_now.txt'),'r') as f:
        similar_now=f.read()
    list_now=similar_now.split(' ')
    list_now[-1]=list_now[-1].replace('\n','')
    return list_now