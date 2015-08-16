package email;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Email {
  private String from;
  
  private String to;
  
  private String subject;
  
  private String content;
  
  @Pure
  public String getFrom() {
    return this.from;
  }
  
  public void setFrom(final String from) {
    this.from = from;
  }
  
  @Pure
  public String getTo() {
    return this.to;
  }
  
  public void setTo(final String to) {
    this.to = to;
  }
  
  @Pure
  public String getSubject() {
    return this.subject;
  }
  
  public void setSubject(final String subject) {
    this.subject = subject;
  }
  
  @Pure
  public String getContent() {
    return this.content;
  }
  
  public void setContent(final String content) {
    this.content = content;
  }
}
