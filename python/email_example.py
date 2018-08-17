import os
import sys
from email.mime.text import MIMEText
import smtplib
import tempfile

email_content = tempfile.NamedTemporaryFile(mode='w+t')

print >>email_content, "This is my content"
print >>email_content, "Thank you for reading"

email_content.seek(0)

email_body = ""
for line in email_content :
    email_body = email_body + line

email_content.close()

msg = MIMEText(email_body)

msg['Subject'] = "This is my email message"
msg['From'] = "me@email.com"
msg['To'] = "you@email.com"

s = smtplib.SMTP("192.168.70.7",25)
s.sendmail(msg['From'], msg['To'], msg.as_string())
s.quit()


