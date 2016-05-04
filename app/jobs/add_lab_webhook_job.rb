class AddLabWebhookJob < ApplicationJob
  queue_as :default

  def perform(lab_id)
    lab = Lab.find_by(lab_id)
    Adapters::GitHubWrapper.new.create_lab_webhook(lab)
  end
end
