require 'bcrypt'

class User 

	include DataMapper::Resource

	attr_reader 	  :password
	attr_accessor 	:password_confirmation

	property :id,       				Serial
	property :email,    				String
	property :github_user,			String		
	property :rfid_code,        String
	property :password_digest,  Text

	has n, :UserMessages
	
	validates_format_of       :email, as: :email_address
	validates_uniqueness_of   :email, :github_user
	validates_confirmation_of :password
	validates_presence_of     :email, :github_user 
	validates_length_of       :password, min: 1
	validates_length_of       :password_confirmation, min: 1
	validates_with_method     :github_user, :method => :check_for_github_existence

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
		user = first(email: email)
		if user && BCrypt::Password.new(user.password_digest) == password 
			user
		else
			nil
		end
	end

	def check_for_github_existence
		uri = URI.parse("https://github.com/users/#{self.github_user}/contributions")
		response = Net::HTTP.get_response(uri)

		if response.code == "200"
			return true
		else 
			[ false, "This github user doesn't exist"]
		end

	end

	def destroy_all_user_messages
		self.UserMessages.all.destroy
	end

end