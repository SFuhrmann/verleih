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

  
  #		while @x < @lendingusers.size
#			if @dvd.userids == ""
#				@dvd.userids = '#{@lendingusers[@x]}' 
#			else 
#				@dvd.userids = '#{@dvd.userids}, #{@lendingusers[@x]}' 
#			end 
#		end 
  
  
  
  # PUT /dvds/1
  # PUT /dvds/1.xml
  def update
    @dvd = Dvd.find(params[:id])
    @user = User.all
    if current_user.role == "admin" || current_user.role == "mitarbeiter"
	respond_to do |format|
	if @dvd.update_attributes(params[:dvd])
	format.html { redirect_to(@dvd, :notice => 'DVD wurde gespeichert.') }
	format.xml { head :ok }
	else
	format.html { render :action => "edit" }
	format.xml { render :xml => @dvd.errors, :status => :unprocessable_entity }
	end
	end
	else

	if user_signed_in?
	@x = 0 
	@y = false 
	
	@dvdusers = @dvd.userids.split("-") 
while @x < @dvdusers.size 
if @dvdusers[@x] == current_user.id.to_s 
@y = true 
end 
@x = @x +1 
end 
if @y == true

else

end 
if @y == true
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
end end end end

	respond_to do |format|
      if @dvd.update_attributes(params[:dvd])
        format.html { redirect_to(@dvd, :notice => 'Änderungen gespeichert') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dvd.errors, :status => :unprocessable_entity }
      end
    end
   
      

      @user.each do |u|
        if u.dvdslent.nil?
        
        else
   		  usplit = u.dvdslent.split("-")
   		  
   		  if Dvd.userids.nil?
   			u.dvdslent = 10000000
   			u.save
          else
            usersplit = Dvd.userids.split("-")
          end
   		
   		
   		
        
    end
  end

    
  end

end
