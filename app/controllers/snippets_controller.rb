class SnippetsController < ApplicationController

  before_filter :authenticate_user! #, :except => [:index , :search]

  def tag_cloud
    @tags = Snippet.tag_counts_on(:tags)
  end
  
  def search
    @snippets = Snippet.search params[:search]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @snippets }
    end
  end

  # GET /snippets
  # GET /snippets.xml
  def index
    @snippets = Snippet.paginate(:all,:order => 'title ASC', :per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @snippets }
    end
  end

  # GET /snippets/1
  # GET /snippets/1.xml
  def show
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @snippet }
    end
  end
  
  def lenguaje
    @snippets = Snippet.find(:all,:conditions => ["lenguaje = ?",params[:id]])
    respond_to do |format|
      format.html
      format.xml { render :xml => @snippets }
    end
  end

  def tags
    
    @snippets = Snippet.tagged_with(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @snippets }
    end
  end
  # GET /snippets/new
  # GET /snippets/new.xml
  def new
    @snippet = Snippet.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @snippet }
    end
  end

  # GET /snippets/1/edit
  def edit
    @snippet = Snippet.find(params[:id])
  end

  # POST /snippets
  # POST /snippets.xml
  def create
    @snippet = Snippet.new(params[:snippet])
    respond_to do |format|
      if @snippet.save
        flash[:notice] = 'Snippet was successfully created.'
        format.html { redirect_to(@snippet) }
        format.xml  { render :xml => @snippet, :status => :created, :location => @snippet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @snippet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /snippets/1
  # PUT /snippets/1.xml
  def update
    @snippet = Snippet.find(params[:id])
    
    respond_to do |format|
      if @snippet.update_attributes(params[:snippet])
        flash[:notice] = 'Snippet was successfully updated.'
        format.html { redirect_to(@snippet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @snippet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.xml
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to(snippets_url) }
      format.xml  { head :ok }
    end
  end
end
