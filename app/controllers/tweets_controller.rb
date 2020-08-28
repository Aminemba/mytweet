class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all.order("created_at DESC")
    @tweet = Tweet.new
  end


  def show
  end


def new
    #@tweet = current_user.tweets.build
  if params[:back]
    @tweet = Tweeet.new(tweeet_params)
  else
    @tweet = Tweeet.new
  end
end

  def edit
  end


  def create
    @tweeet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweeet.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweeet }
      else
        format.html { render :new }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
        @tweet = Tweet.new(tweeet_params)
        render :new if @tweet.invalid?
  end

  def back
        @tweet = Tweet.edit(tweet_params)
        render :choose_new_or_edit if @tweet.invalid?
  end




  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tweet
    @tweet = Tweet.find(params[:id])
    end
    def tweet_params
    params.require(:tweet).permit(:tweet)
    end

end
