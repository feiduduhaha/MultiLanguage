#!/usr/bin/python3
import os
import sys
import re
import csv
from tkinter import filedialog

print("\n*****************执行过滤过程中的中文字符串添加'.multi'后缀，并生成映射表格的脚本**********************\n")
# 请求选择文件夹/目录
answer = filedialog.askdirectory(initialdir=os.getcwd(), title="选择需要过滤的目录")
workPath = answer + '/'
print(workPath)
if len(workPath) == 0:
    print("未选择目录，脚本停止运行")
    sys.exit(0)
    
# 获取文件的内容
def get_contends(path):
    with open(path) as file_object:
        contends = file_object.read()
    file_object.close()
    return contends

# 文件内数据以行为单位存入数组
def get_contends_arr(contends):
    contends_arr = str(contends).split('\n')
    return contends_arr



if os.path.isdir(workPath):

    print("开始匹配" + workPath + " 下的文件")
else:
    sys.exit(0)

# 遍历工作目录，将所有需要过滤的文件筛选出来
needHandleFilesArr = set()
for root, dirs, files in os.walk(workPath, topdown=False):
    for file in files:
        if file.endswith('.h'):
            needHandleFilesArr.add(os.path.join(root, file))
        elif file.endswith('.m'):
            needHandleFilesArr.add(os.path.join(root, file))
        elif file.endswith('.mm'):
            needHandleFilesArr.add(os.path.join(root, file))
        elif file.endswith('.xib'):
            needHandleFilesArr.add(os.path.join(root, file))
        elif file.endswith('.storyBoard'):
            needHandleFilesArr.add(os.path.join(root, file))
        else:
            print("忽略" + os.path.join( file ))

print ("\n只过滤.h .m .mm .xib .storyBoard中的中文生成映射，共%d份文件需要处理\n" % (len(needHandleFilesArr)))

# 遍历所有需要筛选的文件，将满足条件的字符串保存到字典中，重名暂时不做区分（特定的翻译数量较少，出现这种情况可以手动再映射表里添加一项）
multiDic = {}
for filePath in needHandleFilesArr:#循环文件

	totalString = get_contends(filePath)
	stringArr = get_contends_arr(totalString)
	print ("正则读取过滤" + filePath)
	shouldReWrite = 0

	if filePath.endswith('.xib') or filePath.endswith('.storyBoard'):
		#xib 和 storyBoard 中的过滤
		for lineSring in stringArr:#循环每一行内容
			resultArr = re.findall('="[^"]*[\u4e00-\u9fa5]+.*?"', lineSring, re.U)
			for targetStr in resultArr:
				multiDic[targetStr[2:-1]] = {'key':targetStr[2:-1] , 'zh_CN':targetStr[2:-1] , 'en_GB':'' , 'ja_JP':''}
	else: 
		for lineSring in stringArr:#循环每一行内容
			resultArr = re.findall('@"[^"]*[\u4e00-\u9fa5]+.*?"', lineSring, re.U)
			for targetStr in resultArr:
				if  len(targetStr) > 0:
					#将文字写入json文件
					multiDic[targetStr[2:-1]] = {'key':targetStr[2:-1] , 'zh_CN':targetStr[2:-1] , 'en_GB':'' , 'ja_JP':''}
					newlineStr = lineSring.replace(targetStr,targetStr + ".multi")
					#替换该行内容
					totalString = totalString.replace(lineSring,newlineStr)
					totalString = totalString.replace(".multi.multi",".multi")
					shouldReWrite = 1
	if shouldReWrite:
		print ("替换写入" + filePath)
	with open(filePath, 'w') as file_object:
		file_object.write(totalString)
		file_object.close()    


#创建表格文件
# 1. 创建文件对象
# 2. 基于文件对象构建 csv写入对象
# 3. 构建列表头
csvfilePath = os.path.join(os.path.expanduser('~'),"Desktop/multi-language.csv")
csvFile = open(csvfilePath,'w',encoding='utf-8-sig',newline="")
csv_writer = csv.writer(csvFile)
csv_writer.writerow(["key","zh_CN","en_GB","ja_JP"])
# 4. 将字典写入表格文件
for key in multiDic.keys():#循环每一行内容
	csv_writer.writerow([key,key,'',''])
# 5. 关闭文件
csvFile.close()
print ("处理完毕生成scv表格文件")
print ("\n*****************过滤脚本执行完毕，翻译桌面上的multi-language.csv，并核对git变动记录****************************************\n")
sys.exit(0)
