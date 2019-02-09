require 'json'

module SendGrid
  class SubscriptionTracking
    def initialize(options = {})
      enable = options.fetch(:enable, nil)
      text = options.fetch(:text, nil)
      html = options.fetch(:html, nil)
      substitution_tag = options.fetch(:substitution_tag, nil)

      @enable = enable
      @text = text
      @html = html
      @substitution_tag = substitution_tag
    end

    def enable=(enable)
      @enable = enable
    end

    def enable
      @enable
    end

    def text=(text)
      @text = text
    end

    def text
      @text
    end

    def html=(html)
      @html = html
    end

    def html
      @html
    end

    def substitution_tag=(substitution_tag)
      @substitution_tag = substitution_tag
    end

    def substitution_tag
      @substitution_tag
    end

    def to_json(*)
      {
        'enable' => self.enable,
        'text' => self.text,
        'html' => self.html,
        'substitution_tag' => self.substitution_tag
      }.delete_if { |_, value| value.to_s.strip == '' }
    end
  end
end
