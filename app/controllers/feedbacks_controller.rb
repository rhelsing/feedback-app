class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:new, :create, :show_by_token]
  skip_before_action :verify_authenticity_token

  def show_by_token
    # sleep 2
    if Feedback.where(user: Feedback.users[params["my_token"]]).present?
      @feedbacks = Feedback.where(user: Feedback.users[params["my_token"]])
    else
      sleep 10
      redirect_to :status => 404
    end

  end

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to new_feedback_url, notice: 'Feedback was successfully created. Thanks!' }
        format.json { render :new, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:token, :goals_for_week, :last_week, :something_small)
    end
end
