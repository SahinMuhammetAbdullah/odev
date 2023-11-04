import socket
import ssl

def send_email(username, to, subject, message):
  # Gmail SMTP sunucusunun adresi ve portu (SSL üzerinden 465)
  smtp_server = 'smtp.gmail.com'
  smtp_port = 465

  # Soket oluştur
  client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  client_socket = ssl.wrap_socket(client_socket)

  client_socket.connect((smtp_server, smtp_port))

  # Sunucu karşılama mesajını al
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  # Giriş yapmak için kimlik bilgilerini gönder
  client_socket.send(b'EHLO gmail.com\r\n')
  recv_data = client_socket.recv(1024)
  print('EHLO bağlandı')
  print(recv_data.decode())

  client_socket.send(b'AUTH LOGIN\r\n')
  recv_data = client_socket.recv(1024)
  print('AUTH LOGIN bağlandı')
  print(recv_data.decode())

  client_socket.send(b'gonderenAdresBase64Kod==\r\n')
  recv_data = client_socket.recv(1024)
  print('E-posta adresi base64 olarak gönderildi')
  print(recv_data.decode())

  client_socket.send(b'gonderenAdresSifreBase64Kod\r\n')
  recv_data = client_socket.recv(1024)
  print('Şifre base64 olarak gönderildi')
  print(recv_data.decode())

  # E-posta gönderme işlemi
  client_socket.send(f'MAIL FROM: <{username}>\r\n'.encode())
  recv_data = client_socket.recv(1024)
  print('E-posta adresi verildi')
  print(recv_data.decode())

  client_socket.send(f'RCPT TO: <{to}>\r\n'.encode())
  recv_data = client_socket.recv(1024)
  print('Alıcı adresi verildi')
  print(recv_data.decode())

  client_socket.send(b'DATA\r\n')
  recv_data = client_socket.recv(1024)
  print('DATA gönderildi')
  print(recv_data.decode())

  client_socket.send(f'Subject: {subject}\r\n\r\n{message}\r\n.\r\n'.encode())
  recv_data = client_socket.recv(1024)
  print('E-posta gönderildi')
  print(recv_data.decode())

  # Bağlantıyı kapat
  client_socket.send(b'QUIT\r\n')
  recv_data = client_socket.recv(1024)
  print('QUIT gönderildi')
  print(recv_data.decode())

  client_socket.close()

  print('Sistem tamamlaniyor. Alici mail kutusunu kontrol edebilir.')


if __name__ == '__main__':
  # Gmail hesap bilgileri
  gmail_username = 'gonderenAdres@gmail.com'
  to_email = 'aliciAdres@gmail.com'
  email_subject = 'Odev Ciktisi'
  email_message = 'Odev basari ile tamamlanmistir.'

  send_email(gmail_username,  to_email, email_subject, email_message)
