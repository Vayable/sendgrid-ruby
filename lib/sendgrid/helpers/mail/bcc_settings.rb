require 'json'

module SendGrid
  class BccSettings

    def initialize(options = {})
      enable = options.fetch(:enable, nil)
      email = options.fetch(:email, nil)

      @enable = enable
      @email = email
    end

    def enable=(enable)
      @enable = enable
    end

    def enable
      @enable
    end

    def email=(email)
      @email = email
    end

    def email
      @email
    end

    def to_json(*)
      {
        'enable' => self.enable,
        'email' => self.email
      }.delete_if { |_, value| value.to_s.strip == '' }
    end
  end
end
