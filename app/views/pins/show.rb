# frozen_string_literal: true

class Views::Pins::Show < Views::Base
  def initialize(pin:)
    @pin = pin
  end

  def view_template
    h1 { "Pins::Show" }
    p { "Find me in app/views/pins/show.rb" }
  end
end
