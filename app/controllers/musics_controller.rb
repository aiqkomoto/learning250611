class MusicsController < ApplicationController
  before_action :set_music, only: %i[ show edit update destroy ]

  # GET /musics or /musics.json
  def index
    sort_column = %w[name performer lyricist composer arranger length].include?(params[:sort]) ? params[:sort] : 'name'
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    
    @musics = Music.search_by_keyword(params[:keyword]).order("#{sort_column} #{sort_direction}")
  end

  # GET /musics/1 or /musics/1.json
  def show
  end

  # GET /musics/new
  def new
    @music = Music.new
  end

  # GET /musics/1/edit
  def edit
  end

  # POST /musics or /musics.json
  def create
    @music = Music.new(music_params)

    respond_to do |format|
      if @music.save
        format.html { redirect_to @music, notice: t('messages.created', model: Music.model_name.human) }
        format.json { render :show, status: :created, location: @music }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musics/1 or /musics/1.json
  def update
    respond_to do |format|
      if @music.update(music_params)
        format.html { redirect_to @music, notice: t('messages.updated', model: Music.model_name.human) }
        format.json { render :show, status: :ok, location: @music }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1 or /musics/1.json
  def destroy
    @music.destroy!

    respond_to do |format|
      format.html { redirect_to musics_path, status: :see_other, notice: t('messages.destroyed', model: Music.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def music_params
      params.expect(music: [ :name, :performer, :lyricist, :composer, :arranger, :length, :description ])
    end
end
