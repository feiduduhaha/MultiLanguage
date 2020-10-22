#!/usr/bin/python3
import os
import sys
import re
import csv
import json
import glob

workPath = "/Users/silence/DeskTop/multi-language.csv"

needHandleKeyDic = {}
#从表格文件获取
with open('/Users/silence/DeskTop/multi-language.csv') as csvFile:
    table = csv.reader(csvFile)
    for (key,zh_CN,en_GB,ja_JP) in table:
        needHandleKeyDic[('@"' + key + '"')] = {"zh_CN":zh_CN,"en_GB":en_GB,"ja_JP":ja_JP}

csvFile.close()

json_Str = json.dumps(needHandleKeyDic, ensure_ascii=False)
with open("/Users/silence/DeskTop/multi-language.json", "w", encoding='utf-8-sig') as f:
	json.dump(needHandleKeyDic, f, ensure_ascii=False)

print ("\n将桌面上的multi-language.json文件拖入工程即可\n")
sys.exit(0)
