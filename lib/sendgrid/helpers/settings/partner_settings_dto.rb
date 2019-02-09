module SendGrid
  class PartnerSettingsDto
    attr_reader :new_relic

    def self.fetch(options = {})
      sendgrid_client = options.fetch(:sendgrid_client, nil)
      name = options.fetch(:name, nil)
      query_params = options.fetch(:query_params, nil)

      sendgrid_client.partner_settings.public_send(name).get(query_params: query_params)
    end

    def self.update(options = {})
      sendgrid_client = options.fetch(:sendgrid_client, nil)
      name = options.fetch(:name, nil)
      request_body = options.fetch(:request_body, nil)

      sendgrid_client.partner_settings.public_send(name).patch(request_body: request_body)
    end
  end
end
