#!/usr/bin/python3
import os
import sys
import re
import csv

workPath = "/Users/silence/Documents/Dachen_Work/VCS/VCS/VCS/"
# workPath = "/Users/silence/DeskTop/"

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
    
    print("\n开始匹配" + workPath + " 下的文件\n")
else:
	sys.exit(0)

needHandleFilesArr = set()
for root, dirs, files in os.walk(workPath):
    for file in files:
    	if file.endswith('.h'):
    		needHandleFilesArr.add(os.path.join(root, file))
    	elif file.endswith('.m'):
    		needHandleFilesArr.add(os.path.join(root, file))
    	elif file.endswith('.mm'):
    		needHandleFilesArr.add(os.path.join(root, file))
    	else:
        	print("忽略" + os.path.join( file ))

print ("\n除去.png、.jpg、.json、.DS_Store、.xib、.storyBoard等文件后，共%d份文件需要处理\n" % (len(needHandleFilesArr)))


#创建表格文件
# 1. 创建文件对象
# 2. 基于文件对象构建 csv写入对象
# 3. 构建列表头
csvFile = open('/Users/silence/DeskTop/multi-language.csv','w',encoding='utf-8-sig',newline="")
csv_writer = csv.writer(csvFile)
csv_writer.writerow(["key","zh_CN","en_GB","ja_JP"])


for filePath in needHandleFilesArr:#循环文件

    totalString = get_contends(filePath)
    stringArr = get_contends_arr(totalString)
    print ("正则读取过滤" + filePath)
    shouldReWrite = 0

    for lineSring in stringArr:#循环每一行内容
        newlineStr = ''
        resultArr = re.findall('@"[^"]*[\u4e00-\u9fa5]+.*?"', lineSring, re.U)
        for targetStr in resultArr:
            if  len(targetStr) > 0:#将文字写入json文件
                csv_writer.writerow([targetStr[2:-1],targetStr[2:-1],'',''])
                newlineStr = lineSring.replace(targetStr,targetStr + ".multi")
                #替换该行内容
                totalString = totalString.replace(lineSring,newlineStr)
                shouldReWrite = 1
    if shouldReWrite:
        print ("正则替换写入" + filePath)
        with open(filePath, 'w') as file_object:
            file_object.write(totalString)
            file_object.close()

# 5. 关闭文件
csvFile.close()
print ("\n处理完毕生成scv表格文件" + "\n")
sys.exit(0)   
