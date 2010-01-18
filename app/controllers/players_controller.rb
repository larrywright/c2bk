class PlayersController < ApplicationController
  # GET /players
  # GET /players.xml
  def index
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players }
    end
  end

  # GET /players/1
  # GET /players/1.xml
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/new
  # GET /players/new.xml
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.xml
  def create
    @player = Player.new(params[:player])
    if @player.password_hash == @player.password_salt
      @player.password = @player.password_hash
    else
      flash[:notice] = 'passwords dont match'
    end

    respond_to do |format|
      if @player.save
        flash[:notice] = 'Player was successfully created.'
        format.html { redirect_to(@player) }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @player = Player.find(params[:id])
    
    if params[:player][:password_hash] != params[:player][:password_salt]
      errors = true
      flash[:notice] = 'Passwords unmatched'
    else
      password = params[:player][:password_hash]
      params[:player].delete('password_hash')
      params[:player].delete('password_salt')
    end

    respond_to do |format|
      if !errors && @player.update_attributes(params[:player])
        if password != ''
          @player.password = password
          @player.save
        end
        flash[:notice] = 'Player was successfully updated.'
        format.html { redirect_to(@player) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml  { head :ok }
    end
  end

  # POST /players/signin/
  def signin
    @player = Player.signin
    
    if request.post?
      player = Player.find(:first, :conditions => ['username = ?', params[:username]])
      if user.blank? ||
        Digest::SHA256.hexdigest(params[:password] + user.password_salt) != user.password_has
        raise "Username or password invalid"
      end
      session[:player] = player.id
      redirect_to :action => session[:indended_action], :controller => session[:intended_controller]
    end
  end
end
