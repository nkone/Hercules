#!/usr/bin/python

import  smtplib
import  getpass

user = raw_input('From email: ')
passw = getpass.getpass('password: ')
receiver = raw_input('To: ').split()
subject = raw_input('Enter subject: ')
body    = raw_input('Enter message: \n')
ribi = open('ribi2.txt', 'r').read()
email_msg = "%s\n%s" % (body, ribi)

try:
    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    server.ehlo()
#server.starttls()
    server.login(user, passw)
    server.sendmail(user, receiver, email_msg)
    server.quit()
except:
    print('Something went wrong...')


