class ParanoidController < ApplicationController


  def restore
    if Assignment.only_deleted.find(params[:id]).recover
      redirect_to deleted_assignments_path,notice: "successfully restored"
    else
      redirect_to deleted_assignments_path,notice: "Something went wrong."
    end
  end

  def delete_forever
    @assignment = Assignment.only_deleted.find(params[:id])
    if @assignment.destroy!
      redirect_to deleted_assignments_path,notice: "successfully destroyed record forever"
    else
      redirect_to deleted_assignments_path,notice: "Something went wrong."
    end
  end

end
