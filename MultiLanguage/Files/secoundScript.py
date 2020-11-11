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

plistfilePath = os.path.join(os.path.expanduser('~'),"Desktop/result.plist")
with open(plistfilePath, 'wb') as fp:
     dump(needHandleKeyDic, fp)


print("\n*****************转换为plist成功，输出为桌面/result.plist**********************\n")
sys.exit(0)
