class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :mobile_number

  def headers
    {
      :subject => "Acknowlegement mail ",
      :to => %(<#{email}>),
      :from => %("#{name}" <#{email}>)
    }
  end
end