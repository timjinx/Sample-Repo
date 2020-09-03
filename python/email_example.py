import os
import sys
from email.mime.text import MIMEText
import smtplib
import tempfile

email_content = tempfile.NamedTemporaryFile(mode='w+t')
smpt_server = "localhost"

print >>email_content, "This is my content"
print >>email_content, smtp_server
print >>email_content, "Thank you for reading"

email_content.seek(0)

email_body = ""
for line in email_content :
    email_body = email_body + line

email_content.close()

msg = MIMEText(email_body)

msg['Subject'] = "This is my email message"
msg['From'] = "sender@example.com"
msg['To'] = "recipient1@example.com,recipient2@example.com"

s = smtplib.SMTP(smtp_server,25)
s.sendmail(msg['From'], msg['To'].split(","), msg.as_string())
s.quit()
