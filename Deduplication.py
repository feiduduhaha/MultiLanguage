#!/usr/bin/python3
import os
import sys
import re
import csv
import json
import glob
from tkinter import filedialog

print("\n*****************执行去重脚本 ,第一步选择已经配置的json文件**********************\n")
# 请求选择文件夹/目录
ori_filetypes = [('all files', '.*'), ('json映射文件', '.json')]
filePathOri = filedialog.askopenfilename(initialdir=os.getcwd(),title="选择已经配置的json文件",filetypes=ori_filetypes)
print("\n工程中已经配置的多语言json文件：" + filePathOri)
if len(filePathOri) == 0:
	print("\n未选择文件，停止运行")
	sys.exit(0)
	
print("\n*****************第二部选择新生成的csv表格文件**********************\n")
new_filetypes = [('all files', '.*'), ('新的csv表格文件', '.csv')]
filePathNew = filedialog.askopenfilename(initialdir=os.getcwd(),title="选择已经配置的json文件",filetypes=new_filetypes)
print("\n工程中已经配置的多语言json文件：" + filePathNew)
if len(filePathNew) == 0:
	print("\n未选择文件，停止运行")
	sys.exit(0)
    
oriDic = {}
needFoucesDic = {}
#从json文件获取
with open(filePathOri,'r', encoding='UTF-8') as f:
	oriDic = json.load(f)
#从表格文件获取
with open(filePathNew) as csvFile:
	table = csv.reader(csvFile)
	for (key,zh_CN,en_GB,ja_JP) in table:
		dicKey = "@\"" + key + "\""
		if not dicKey in oriDic.keys():
			needFoucesDic[key] = {'key':key , 'zh_CN':zh_CN , 'en_GB':en_GB , 'ja_JP':ja_JP}
#创建表格文件
# 1. 创建文件对象
# 2. 基于文件对象构建 csv写入对象
# 3. 构建列表头
csvfilePath = os.path.join(os.path.expanduser('~'),"Desktop/去重后需要翻译的中文.csv")
csvFile = open(csvfilePath,'w',encoding='utf-8-sig',newline="")
csv_writer = csv.writer(csvFile)
# 4. 将字典写入表格文件
print("\newline")
print(needFoucesDic)
print("\n")
for value in needFoucesDic.values():#循环每一行内容
	
	csv_writer.writerow([value["key"],value["zh_CN"],value["en_GB"],value["ja_JP"]])
# 5. 关闭文件
csvFile.close()
print ("去重完毕生成scv表格文件")
print ("\n*****************去重完毕****************************************\n")
sys.exit(0)
