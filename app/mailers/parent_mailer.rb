class ParentMailer < ApplicationMailer
  def welcome_email(parent)
    @parent = parent
    @student = @parent.students
    mail(to: @parent.email, :reply_to => APP_CONFIG['fromemail'], subject: 'Welcome to maktab')
  end
end
