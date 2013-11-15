class HeartsController < ApplicationController
  def create
    @heart = Heart.new(heart_params)

    respond_to do |format|
      if @heart.save
        format.html { redirect_to @heart.post, notice: 'Post is favorited.' }
      else
        redirect_to root_path, notice: "Had issue favoriting the post"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heart
      @heart = Heart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heart_params
      params.require(:heart).permit(:post_id)
    end
end
