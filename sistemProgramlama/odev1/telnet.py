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
  print(recv_data.decode())

  client_socket.send(b'AUTH LOGIN\r\n')
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  client_socket.send(b'YXBvNjkwYXBvQGdtYWlsLmNvbQ==\r\n')
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  client_socket.send(b'c3d2eSBmYW92IHV3ZHQgdmFrYQ==\r\n')
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  # E-posta gönderme işlemi
  client_socket.send(f'MAIL FROM: <{username}>\r\n'.encode())
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  client_socket.send(f'RCPT TO: <{to}>\r\n'.encode())
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  client_socket.send(b'DATA\r\n')
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  client_socket.send(f'Subject: {subject}\r\n\r\n{message}\r\n.\r\n'.encode())
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  # Bağlantıyı kapat
  client_socket.send(b'QUIT\r\n')
  recv_data = client_socket.recv(1024)
  print(recv_data.decode())

  client_socket.close()


if __name__ == '__main__':
  # Gmail hesap bilgileri
  gmail_username = 'apo690apo@gmail.com'
  to_email = 'm.sahinabdullah@gmail.com'
  email_subject = 'Odev Ciktisi'
  email_message = 'Odev basari ile tamamlanmistir.'

  send_email(gmail_username,  to_email, email_subject, email_message)
