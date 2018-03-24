class ParticipatesController < ApplicationController

  def create
    @participate = current_user.participates.build(post_id: params[:post_id])
    
    if @participate.save(participate_params)
      flash[:notice] = "Successfully participated"
      redirect_to post_path(@post)
    else
      flash[:alert] = @participate.errors.full_messages.to_sentence
      redirect_to post_path(@post)
    end
  end

  private

  def participate_params
    params.require(:participate).permit(:user_id, :post_id)
  end
end
