package email;

import email.Email;

@SuppressWarnings("all")
public interface EmailSender {
  public abstract void send(final Email email);
}
