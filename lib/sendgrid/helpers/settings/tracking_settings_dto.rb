module SendGrid
  class TrackingSettingsDto
    attr_reader :open, :click, :google_analytics, :subscription
    alias :click_tracking :click
    alias :open_tracking :open
    alias :subscription_tracking :subscription

    def self.fetch(options = {})
      sendgrid_client = options.fetch(:sendgrid_client, nil)
      name = options.fetch(:name, nil)
      query_params = options.fetch(:query_params, nil)

      name = scrub_alias_names(name.to_s)
      sendgrid_client.tracking_settings.public_send(name).get(query_params: query_params)
    end

    def self.update(options = {})
      sendgrid_client = options.fetch(:sendgrid_client, nil)
      name = options.fetch(:name, nil)
      request_body = options.fetch(:request_body, nil)

      name = scrub_alias_names(name.to_s)
      sendgrid_client.tracking_settings.public_send(name).patch(request_body: request_body)
    end

    private

    def self.scrub_alias_names(name)
      name.gsub(/_tracking/, '')
    end
  end
end
