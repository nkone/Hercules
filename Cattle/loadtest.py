#!/usr/bin/python
# -*- coding: UTF-8 -*-
import requests
from progressbar import progressbar
import time
import validators
import sys
import getpass
import timeit

if len(sys.argv) == 1:
    f = open('man.txt')
    for line in f:
        print(line)
filename = 'log.txt'
f = open(filename, 'w')
#url = 'http://10.112.2.7:8000'
ret = False
while (ret != True):
    url = input('Input url: ')
    ret = validators.url(url)
    if (ret != True):
        print('Error: please enter a valid address')
req = input('Input number of requests: ') 
no_req = int(req)
#for i in progressbar(range(no_req), "requesting: ", 30):
#    resp = requests.head(url)
#    time.sleep(0.1)
# 
print(no_req)
def process_attack():
    success = 0
    failure = 0
    size = 0
    start_time = time.perf_counter()
    for i in range(no_req):
        resp = requests.head(url)
        if (resp.status_code < 400):
            success += 1
        elif (resp.status_code >= 400):
            failure += 1
        size += int(resp.headers['Content-Length'])
    end_time = time.perf_counter() - start_time
    attack_speed = no_req / end_time
    percent_success = ((1 - (failure/success))*100)
    size /= 1000000
    print('Transaction size: ', round(size, 2), 'MB', file=f)
    print('Succesful transactions: ', success, file=f)
    print('Failed transactions: ', failure, file=f)
    print('Success rate: ', percent_success, '%', file=f)
    print('Time elapsed: ', round(end_time, 2), 'secs', file=f)
    print('Transaction speed: ', round(attack_speed, 2), 'trans/secs', file=f)
process_attack()
print('Program completed: see log.txt for details')
#print (type(resp))
#url = 'http://www.google.com'
#ret = validators.url(url)
#if (ret != True):
#    print('Error')
