# coding: utf-8
import MySQLdb

class SqlUtil(object):
    def __init__(self):
        self.conn=MySQLdb.connect(host='127.0.0.1',port=3306,user='root',passwd='5211314',db='Faq',charset='utf8')
    def insert(self,fqa):
        count=0
        cursor=self.conn.cursor()
        for qa in fqa.question:
            # 执行sql语句
            cursor.execute("insert into qa(question,answer) values('%s','%s')" %(qa[1],fqa.para))
            count+=1

        try:
            # 提交到数据库执行
            self.conn.commit()
        except Exception as e:
            # 如果发生错误则回滚
            self.conn.rollback()
        finally:
            cursor.close()
            return count
    def isExist(self,fqa):
        cursor=self.conn.cursor()
        de=[]
        count=0
        for qa in fqa.question:
            # 执行sql语句
            cursor.execute("select * from qa where question='%s'" %(qa[1]))
            if cursor.fetchall():
                de.append(qa)
        for d in de:
            fqa.question.remove(d)
        if fqa.question:
            count=self.insert(fqa)
            cursor.close()
            return count
        return count
    def close(self):
        try:
            if self.conn:
                self.conn.close()
        except:
            pass
