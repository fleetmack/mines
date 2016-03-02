CREATE OR REPLACE PROCEDURE         ADVANCE.OIA_SENDMAIL
(
  subject      IN VARCHAR2,
  message_body IN VARCHAR2,
  sender       IN VARCHAR2,
  reciever     IN varchar2
)
AS

  crlf         CONSTANT VARCHAR2(2):= CHR(13) || CHR(10);
  smtp_host    CONSTANT VARCHAR(40) := 'exchange.is.mines.edu';
  smtp_port    CONSTANT number := 25;
  message      VARCHAR2(10000);
  v_connection UTL_SMTP.CONNECTION;
  local_host   VARCHAR2(200) := UTL_INADDR.GET_HOST_NAME;

BEGIN

  message := 'Subject: ' || subject
    || crlf
    || SubStr(message_body,1,9000)
    || crlf
    || TO_CHAR(SYSDATE, 'Dy MM/DD/YYYY HH24:MI:SS'); 


  v_connection := UTL_SMTP.OPEN_CONNECTION(smtp_host, smtp_port);
  UTL_SMTP.HELO(v_connection, local_host);
  UTL_SMTP.MAIL(v_connection, sender);
  UTL_SMTP.RCPT(v_connection, reciever);
  UTL_SMTP.DATA(v_connection, message);
  UTL_SMTP.QUIT(v_connection);

END;
 