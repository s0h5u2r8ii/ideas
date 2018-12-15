class WorkNotificationsController < ApplicationController
  def work_link_through
  	@work_notification = WorkNotification.find(params[:id])
    @work_notification.update work_read: true
    @work = @work_notification.work_id
    redirect_to idea_work_path(:idea_id => @work_notification.idea_id, :id => @work_notification.work_id)
  end
end
