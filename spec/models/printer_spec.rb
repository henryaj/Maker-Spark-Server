describe Printer do 

	let(:printer) { Printer.new }
	let(:chars_32) { 'Lorem ipsum dolor sit amet, cons' }
	let(:chars_33) { 'Lorem ipsum dolor sit amet, consa' }

	context "the server can connect to the printer" do 
		it "can send 'hello' plain text prints to the printer" do
			request_stub("TEXT","hello")
			printer.print_text("TEXT","hello")
			expect(a_http_request("TEXT","hello")).to have_been_made
		end

		it "prints the string, if it is not longer than 32 characters" do
			request_stub("TEXT",chars_32)
			expect(printer.check_string_length(chars_32)).to eq([chars_32])
		end

		context	"the string is longer than 32 characters" do
			before do
				request_stub("TEXT",chars_33)
			end

			it "split the string, if it is longer than 32 characters" do
				printer.check_string_length(chars_33)
				expect(printer.check_string_length(chars_33)[0]).to eq(chars_32)
			end

			it "returns an array of the sliced strings, if the string is longer than 32 characters" do
				printer.check_string_length(chars_33)
				expect(printer.check_string_length(chars_33)).to eq ([chars_32,"a"])
			end
		end

		context 'generating personalized prints containing several parts' do
			before do
				morning = Time.local(2014,10,23,11,31)
				Timecop.freeze(morning)
				request_stub("CENTREBIG","Good Morning")
				request_stub("CENTREBIG","~")
			end
			
			it "it prints Good morning" do
	    	printer.print_greeting
	    	expect(a_http_request("CENTREBIG","Good Morning")).to have_been_made
	    end

	    it "has a wrapper for several prints" do
	    	expect(printer.personal_print).not_to be nil
	    end

	    it "has a line divider" do
	    	printer.print_divider
	    	expect(a_http_request("CENTREBIG","~")).to have_been_made
	    end
		end

		context 'generating time dependent prints' do
			
			it "says Good Afternoon after 12:30" do
				afternoon = Time.local(2014,10,23,19,31)
				Timecop.freeze(afternoon)
				request_stub("CENTREBIG","Good Afternoon")
				printer.print_greeting
	    	expect(a_http_request("CENTREBIG","Good Afternoon")).to have_been_made
			end
		end
	end
end



















