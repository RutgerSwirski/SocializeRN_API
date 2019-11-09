class Api::V1::InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :update, :destroy]

  # GET /invites
  def index
    @invites = Invite.where(reciever_id: params[:user_id], status: 'pending')
    render json: @invites.to_json( include: [:sender] )
  end

  # GET /invites/1
  def show
    render json: @invite
  end

  # POST /invites
  def create
    @invite = Invite.new(invite_params)
    @invite.sender = User.find(params[:sender_id])
    @invite.reciever = User.find(params[:reciever_id])
    @invite.date_time = params[:datetime]
    @invite.status = 'pending'
    if @invite.save
      render json: @invite
    else
      render json: @invite.errors
    end
  end

  # PATCH/PUT /invites/1
  def update
    if @invite.update(invite_params)
      render json: @invite
    else
      render json: @invite.errors
    end
  end

  # DELETE /invites/1
  def destroy
    @invite.destroy
  end

  def get_accepted_user_invites
    @invites = Invite.where((reciever_id: params[:user_id] || sender_id: params[:user_id]), status: 'accepted')
    render json: @invites.to_json( include: [:sender] )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invite_params
      params.require(:invite).permit(:date_time, :location, :status, :sender_id, :reciever_id)
    end
end
