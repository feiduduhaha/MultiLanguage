#!/usr/bin/python3
import os
import sys
import re
import csv
import json
import glob
from tkinter import filedialog
from plistlib import *

print("\n*****************执行将CSV表格文件转换为plist文件的脚本**********************\n")
# 请求选择文件夹/目录
my_filetypes = [('all files', '.*'), ('CSV表格文件', '.csv')]
filePath = filedialog.askopenfilename(initialdir=os.getcwd(),title="Please select a file:",filetypes=my_filetypes)

print("\n选择的CSV表格文件为：" + filePath)
if len(filePath) == 0:
    print("\n未选择目录，脚本停止运行")
    sys.exit(0)

needHandleKeyDic = {}
#从表格文件获取
with open(filePath) as csvFile:
    table = csv.reader(csvFile)
    for (key,zh_CN,en_GB,ja_JP) in table:
        needHandleKeyDic[key] = {"zh_CN":zh_CN,"en_GB":en_GB,"ja_JP":ja_JP}

csvFile.close()

jsonfilePath = os.path.join(os.path.expanduser('~'),"Desktop/multi-language.json")
json_Str = json.dumps(needHandleKeyDic, ensure_ascii=False)
with open(jsonfilePath, "w", encoding='utf-8-sig') as f:
    json.dump(needHandleKeyDic, f, ensure_ascii=False)
print ("\n转换完成")
print ("将桌面上的multi-language.json文件拖入工程MainBundle即可\n")
print("\n****************************************************************************\n")

sys.exit(0)
