class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :mobile_number, :validate => { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

  
  def headers
    {
      :subject => "Acknowlegement mail ",
      :to => "bodharthlonkar@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end