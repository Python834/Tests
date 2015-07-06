
#
# Create a user object
#		create with first and last names separately
#		get email from a remote server as a query

require 'net/http'

class CreateUser

	attr_accessor :first, :last
	attr_reader :email
	
	def initialize(first, last) 
		@first = first
		@last = last
		@email = ''
	end
	
	def switch
		@first, @last = @last, @first
	end
	
  def to_s
		"First: #{@first}, Last: #{@last}"
	end
	
	def GetDBUserEmail
		Net::HTTP.start('lockersoft.com') { |http| 
			response = http.get("/getEmail.php?first=#{@first}&last=#{@last}")
			@email = response.body 
			#puts response.body
		}
	end 
	
end


user = CreateUser.new( 'Karl', 'Garrod' )
puts user.email
user.GetDBUserEmail
puts user.email