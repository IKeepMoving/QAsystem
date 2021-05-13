
# coding: utf-8

# In[1]:


from pyltp import *
import os

def get_user_defined_file():
	d = os.path.dirname(os.path.realpath(__file__))
	return os.path.join(d, 'user-defined.txt')
def load_segmentor():
	model_path='/usr/ltp_data_v3.4.0/cws.model'
	my_path=get_user_defined_file()
	segmentor = Segmentor()#实例化分词模块
	segmentor.load_with_lexicon(model_path, my_path) # 加载模型，第二个参数是您的外部词典文件路径
	return segmentor
def load_postagger():
	model_path='/usr/ltp_data_v3.4.0/pos.model'
	postagger=Postagger()#实例化词性标注类
	postagger.load(model_path)#加载分词库
	return postagger
def load_recognizer():
	model_path='/usr/ltp_data_v3.4.0/ner.model'
	recognizer=NamedEntityRecognizer()#命名实体识别
	recognizer.load(model_path)#加载分词库
	return recognizer
def load_parser():
	model_path='/usr/ltp_data_v3.4.0/parser.model'
	parser = Parser()#实例化句法依存树
	parser.load(model_path)#加载分词库
	return parser
def load_labeller():
	model_path='/usr/ltp_data_v3.4.0/pisrl.model'
	labeller=SementicRoleLabeller()#语义角色标注
	labeller.load(model_path)#加载分词库
	return labeller
