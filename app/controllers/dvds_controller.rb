class DvdsController < ApplicationController
  # GET /dvds
  # GET /dvds.xml
  def index
    @dvds = Dvd.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dvds }
    end
  end

  # GET /dvds/1
  # GET /dvds/1.xml
  def show
    @dvd = Dvd.find(params[:id])
	@users = User.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dvd }
    end
  end

  # GET /dvds/new
  # GET /dvds/new.xml
  def new
    @dvd = Dvd.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dvd }
    end
  end

  # GET /dvds/1/edit
  def edit
    @dvd = Dvd.find(params[:id])
  end

  # POST /dvds
  # POST /dvds.xml
  def create
    @dvd = Dvd.new(params[:dvd])
	
	@dvd.userids = ""
	@dvd.verliehen = 0
	@dvd.save

    respond_to do |format|
      if @dvd.save
        format.html { redirect_to(@dvd, :notice => 'Dvd was successfully created.') }
        format.xml  { render :xml => @dvd, :status => :created, :location => @dvd }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dvd.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update


    @dvd = Dvd.find(params[:id])
	@user = User.all
	if current_user.role == "admin" || current_user.role == "mitarbeiter"
		respond_to do |format|
			if @dvd.update_attributes(params[:dvd])
				format.html { redirect_to(@dvd, :notice => 'DVD wurde gespeichert.') }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @dvd.errors, :status => :unprocessable_entity }
			end
		end
	else
	
#		@dvdusers = @user.split('-')
#		@x = 0
#		alreadylent = false
#		
#		while @x < @dvdusers.size
#			if @dvdusers[@x] == current_user.id.to_s
#				alreadylent = true
#			end
#			@x = @x + 1
#		end
			@x = 0 
			@y = false 
			@dvdusers = @dvd.userids.split("-") 
			while @x < @dvdusers.size 
				if @dvdusers[@x] == current_user.id.to_s 
					@y = true 
				end 
				@x = @x +1 
			end 
			if @y == false
				@dvd.verliehen = @dvd.verliehen + 1
				if @dvd.userids == ""
					@dvd.userids = "#{current_user.id}"
				else
					@dvd.userids = "#{@dvd.userids}-#{current_user.id}"
				end
				if current_user.dvdslent == ""
					current_user.dvdslent == "#{@dvd.id}"
				else
					current_user.dvdslent = "#{current_user.dvdslent}-#{@dvd.id}"
				end
				respond_to do |format|
					if @dvd.update_attributes(params[:dvd])
						format.html { redirect_to(@dvd, :notice => 'Dvd wurde erfolgreich ausgeliehen.') }
						format.xml  { head :ok }
					else
						format.html { render :action => "edit" }
						format.xml  { render :xml => @dvd.errors, :status => :unprocessable_entity }
					end
				end
			else
				
				@x = 0
				if current_user.dvdslent.nil?
				  @dvdslent = ""
				end
				@dvdslent = current_user.dvdslent.split("-")
				current_user.dvdslent = ""
		
				while @x < @dvdslent.size
					if @dvdslent[@x] == @dvd.id.to_s
						@dvdslent.delete(@x)
					elsif current_user.dvdslent == ""
						current_user.dvdslent = "#{@dvdslent[@x]}"
					else
						current_user.dvdslent = "#{current_user.dvdslent}-#{@dvdslent[@x]}"
					end
					@x = @x + 1
					

				end
				
				@dvd.verliehen = @dvd.verliehen - 1
				@x = 0
				@dvdusers = @dvd.userids.split("-")
				@dvd.userids = ""
				
				while @x < @dvdusers.size
					if @dvdusers[@x] == current_user.id.to_s
						@dvdusers.delete(@x)
					elsif @dvd.userids == ""
						@dvd.userids = "#{@dvdusers[@x]}"
					else
						@dvd.userids = "#{@dvd.userids}-#{@dvdusers[@x]}"
					end
					@x = @x + 1
					

				end
				respond_to do |format|
						if @dvd.update_attributes(params[:dvd])
							format.html { redirect_to(@dvd, :notice => 'DVD wurde erfolgreich zurueckgegeben.') }
							format.xml  { head :ok }
						else
							format.html { render :action => "edit" }
							format.xml  { render :xml => @dvd.errors, :status => :unprocessable_entity }
						end
				end
			end
		end
	end
	 def destroy
		@dvd = Dvd.find(params[:id])
		@dvd.destroy

		respond_to do |format|
		format.html { redirect_to(dvds_url) }
		format.xml  { head :ok }
	end 
end
	
end

