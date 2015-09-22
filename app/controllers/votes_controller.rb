class VotesController < ApplicationController
	before_action :find_post
	before_action :authenticate
	#user can upvote a post
	def upvote
		if vote_once
			@vote = @post.votes.create(user_id: current_user.id)
		else
			@vote = false
		end
		byebug
		respond_to do |format|
			format.js
		end
	end

	#user can unvote
	def unvote
		
	end

	#but user can only vote a post once
	private
	def find_post
		@post = Post.find(params[:post_id])
	end

	def vote_once
		if @post.votes.where(user_id: current_user.id).any?
			false
		else
			true
		end
	end

	#user need to login to vote
	def authenticate
		if user_signed_in?
			true
		else
			redirect_to new_user_session_path, format: 'js', alert: "please login to vote"
		end
	end


end
