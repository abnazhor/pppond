module Posts
  class GenerateScreenshotJob < ApplicationJob
    queue_as :screenshoter
    limits_concurrency to: 1, key: :screenshoter

    def perform(post)
      Screenshoter.new(post).call
    end
  end
end
