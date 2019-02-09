require 'json'

module SendGrid
  class Header
    def initialize(options = {})
      key = options.fetch(:key, nil)
      value = options.fetch(:value, nil)

      @header = {}
      (key.nil? || value.nil?) ? @header = nil : @header[key] = value
    end

    def header=(header)
      @header = header
    end

    def header
      @header
    end

    def to_json(*)
      {
        'header' => self.header
      }.delete_if { |_, value| value.to_s.strip == '' }
    end
  end
end
