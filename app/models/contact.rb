class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :mobile_number, :validate => /\d{3}-\d{3}-\d{4}/

  def headers
    {
      :subject => "Acknowlegement mail ",
      :to => "bodharthlonkar@gmail.com",
      :to => %(<#{email}>),
      :from => %("#{name}" <#{email}>)
    }
  end
end