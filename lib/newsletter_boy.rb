module NewsletterBoy

  mattr_accessor :host
  mattr_accessor :attributes
  mattr_accessor :protocol
  mattr_accessor :api_mailings

  self.attributes = %w{ gender firstname lastname street ccode pcode city }
  self.protocol = 'https'
  self.host = 'www.newsletterboy.de'
  self.api_mailings = {}

  def self.credentials=(credentials)
    Base.user = credentials[:user]
    Base.pass = credentials[:pass]
  end

  def self.sign_up(recipient)
    raise 'Object muss über das Attribut :email verfügen.' unless recipient.respond_to? :email
    rec = Recipient.new recipient.email
    attributes.each do |attribute|
      if recipient.respond_to? attribute
        rec.send("#{attribute}=", recipient.send(attribute))
      end
    end
    rec.approved = true
    rec.save
    rec
  end


  def self.method_missing *args, &block
    load_api_mailing_or_fail_loud *args
  rescue RestClient::ResourceNotFound
    super
  end

  def self.load_api_mailing_or_fail_loud *args
    identifier = args[0]
    api_mailing = self.api_mailings[identifier] ||= ApiMailing.find(identifier)
    options = args[1]
    api_mailing.options = options
    return api_mailing
  end

  def self.api_mailings
    @@api_mailings
  end

end
