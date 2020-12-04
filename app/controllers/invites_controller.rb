class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  def accept
    logger.info("~log:" + "accept")
    logger.info(params.to_s)
    record = Invite.find_by(reciever: params[:reciever], sender: params[:sender])
    record.accepted = true
    record.save 
  end

  # POST /invites
  # POST /invites.json
  def create
    logger.info("~log_invite: " + invite_params.to_s)
    logger.info("~log_invite: " + invite_params["reciever"])
    @invite = Invite.new(invite_params)
    @invite.sender = current_user.email
    @invite.accepted = false

    invite_old = Invite.find_by(sender: current_user.email, reciever: invite_params["reciever"])
    invite_back = Invite.find_by(reciever: current_user.email, sender: invite_params["reciever"])

    logger.info("~log_old: " + invite_old.nil?.to_s)
    logger.info("~log_back: " + invite_back.nil?.to_s)

    ok = true

    if invite_old.nil?
      ok = @invite.save
    end

    unless invite_back.nil?
      invite_back.accepted = true
      ok = ((invite_back.save) && ok)
      if invite_old.nil?
        @invite.accepted = true
        ok = ((@invite.save) && ok)
      else
        invite_old.accepted = true
        ok = ((invite_old.save) && ok)
      end
    end

    respond_to do |format|
      if ok
        #format.html { redirect_to @invite, notice: 'Invite was successfully created.' }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invite_params
      params.require(:invite).permit(:sender, :reciever, :accepted)
    end
  end
