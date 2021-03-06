CREATE OR REPLACE PROCEDURE                                                         ADVANCE.OIA_SENDMAIL_CC4
(
  subject      IN VARCHAR2,
  message_body IN VARCHAR2,
  sender       IN VARCHAR2,
  reciever     IN VARCHAR2,
  cc           IN VARCHAR2 DEFAULT NULL,
  cc2         IN VARCHAR2 DEFAULT NULL,
  cc3         IN VARCHAR2 DEFAULT NULL,
  cc4         IN VARCHAR2 DEFAULT NULL
)
AS
  crlf         CONSTANT VARCHAR2(2):= CHR(13) || CHR(10);
  smtp_host    CONSTANT VARCHAR(40) := 'smtp.mines.edu';
  smtp_port    CONSTANT number := 25;
  message      VARCHAR2(10000);
  v_connection UTL_SMTP.CONNECTION;
  local_host   VARCHAR2(200) := UTL_INADDR.GET_HOST_NAME;
BEGIN
  message := 'Subject: ' || subject
    || crlf
    || SubStr(message_body,1,29000)
    || crlf
    || TO_CHAR(SYSDATE, 'Dy MM/DD/YYYY HH24:MI:SS'); 
  v_connection := UTL_SMTP.OPEN_CONNECTION(smtp_host, smtp_port);
  UTL_SMTP.HELO(v_connection, local_host);
  UTL_SMTP.MAIL(v_connection, sender);
  UTL_SMTP.RCPT(v_connection, reciever);
  UTL_SMTP.RCPT(v_connection, cc);
  UTL_SMTP.RCPT(v_connection, cc2);
  UTL_SMTP.RCPT(v_connection, cc3);
  UTL_SMTP.RCPT(v_connection, cc4);
  UTL_SMTP.DATA(v_connection, message);
  UTL_SMTP.QUIT(v_connection);
END;