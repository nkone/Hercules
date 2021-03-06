#!/usr/bin/python
# -*- coding: UTF-8 -*-
import requests
from progressbar import progressbar
import time
import validators
import sys
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
def bar_attack():
    success = 0
    failure = 0
    size = 0
    for i in progressbar(range(no_req), "requesting: ", 30):
        resp = requests.head(url)
        time.sleep(0.05)
        if (resp.status_code < 400):
            success += 1
        elif (resp.status_code >= 400):
            failure += 1 
        size += int(resp.headers['Content-Length'])
    size /= 1000000
    percent_success = ((1 - (failure/success))*100)
    print('Transaction size: ', round(size, 2), 'MB', file=f)
    print('Succesful transactions: ', success, file=f)
    print('Failed transactions: ', failure, file=f)
    print('Success rate: ', percent_success, '%', file=f)
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
    avg_time = end_time / no_req
    attack_speed = no_req / end_time
    percent_success = ((success/no_req)*100)
    size /= 1000000
    print('Transaction size: ', round(size, 2), 'MB', file=f)
    print('Succesful transactions: ', success, file=f)
    print('Failed transactions: ', failure, file=f)
    print('Success rate: ', percent_success, '%', file=f)
    print('Time elapsed: ', round(end_time, 2), 'secs', file=f)
    print('Average time: ', round(avg_time, 2), 'secs', file = f)
    print('Transaction speed: ', round(attack_speed, 2), 'trans/secs', file=f)
process_attack()
#bar_attack()
print('Program completed: see log.txt for details')
#print (type(resp))
#url = 'http://www.google.com'
#ret = validators.url(url)
#if (ret != True):
#    print('Error')
