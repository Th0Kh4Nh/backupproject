import os
import shutil
import glob
import smtplib
import time
from datetime import datetime
from dotenv import load_dotenv
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

load_dotenv()

SENDER_EMAIL = os.getenv('SENDER_EMAIL')
APP_PASSWORD = os.getenv('APP_PASSWORD')
RECEIVER_EMAIL = os.getenv('RECEIVER_EMAIL')

#folder backup
BACKUP_DIR = 'backup'

def send_email(subject, body):
    try:
        message = MIMEMultipart()
        message['From'] = SENDER_EMAIL
        message['To'] = RECEIVER_EMAIL
        message['Subject'] = subject
        message.attach(MIMEText(body, 'plain'))
        
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(SENDER_EMAIL, APP_PASSWORD)
        server.send_message(message)
        server.quit()
        
        print("Đã gửi email thành công.")
    except Exception as e:
        print(f"Lỗi gửi email: {e}")

def backup_database():
    try:
        if not os.path.exists(BACKUP_DIR):
            os.makedirs(BACKUP_DIR)
        
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        backup_path = os.path.join(BACKUP_DIR, f"backup_{timestamp}")
        os.makedirs(backup_path)
        
        db_files = glob.glob('*.sql') + glob.glob('*.sqlite3')
        
        if not db_files:
            send_email("Backup thất bại", "Không tìm thấy file database (.sql, .sqlite3) để backup.")
            return
        
        for file in db_files:
            shutil.copy(file, backup_path)
        
        send_email("Backup thành công", f"Đã backup {len(db_files)} file vào thư mục {backup_path}.")
        print("Backup thành công.")
        
    except Exception as e:
        send_email("Backup thất bại", f"Lỗi: {e}")
        print(f"Lỗi backup: {e}")

def main():
    backup_database()

if __name__ == "__main__":
    if not all([SENDER_EMAIL, APP_PASSWORD, RECEIVER_EMAIL]):
        print("Thiếu cấu hình email. Vui lòng kiểm tra file .env.")
    else:
        main()
