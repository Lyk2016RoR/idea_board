class CommentMailer < ApplicationMailer

	def new_comment(idea)
		@idea = idea

		mail to: @idea.user.email, 
			 subject: 'You have a new comment'
	end

end
