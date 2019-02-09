module SendGrid
  class MailSettingsDto
    attr_reader :bcc, :address_whitelist, :bounce_purge, :footer, :forward_spam, :forward_bounce, :plain_content, :spam_check, :template

    def self.fetch(options = {})
      sendgrid_client = options.fetch(:sendgrid_client, nil)
      name = options.fetch(:name, nil)
      query_params = options.fetch(:query_params, nil)

      s = sendgrid_client.mail_settings.public_send(name)
      s.get(query_params: query_params)
    end

    def self.update(options = {})
      sendgrid_client = options.fetch(:sendgrid_client, nil)
      name = options.fetch(:name, nil)
      request_body = options.fetch(:request_body, nil)

      sendgrid_client.mail_settings.public_send(name).patch(request_body: request_body)
    end
  end
end
