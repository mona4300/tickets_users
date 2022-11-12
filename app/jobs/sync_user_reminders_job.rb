class SyncUserRemindersJob
  include Sidekiq::Job

  def perform(user_id, changed_options)
    byebug
    user = User.find_by(id: user_id)
    return unless user.present?

    SyncUserRemindersHandler.new(user, changed_options).sync
  end
end
