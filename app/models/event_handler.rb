class EventHandler

	attr_accessor :rfid_data, :message, :formatter

	def initialize(my_json)
		@rfid_data = my_json
		@message = Message.new
		@formatter = Formatter.new
	end

	def build_message
		message.add_greeting
		message.add_divider
		message.add_time_dependent_message
		
	end

	def print_message(printer)
		printer.print(message)
	end

	def build_rfid_url_message
		message.add_rfid_url(@rfid_data["data"])
	end
end