describe Message do 

	let(:morning_message) { Message.new }
	let(:afternoon_message) { Message.new }
	let(:github) { double :github, name: "benjamin", score_today: 1, current_streak: 4, longest_streak: 10, highscore: [1,2] }




	it "can add a divider" do 
		morning_message.add_divider
		expect(morning_message.lines).to include(["CENTREBIG","~"])
	end


	it "can add data from github" do 
		morning_message.add_data_from_github(github)
		expect(morning_message.lines).to include(["TEXT","Longest streak: 10"])
	end

	it "can add the weather summary" do
		Forecast.any_instance.stub(summary: "Partly cloudy for the hour.")
		morning_message.add_forecast
		expect(morning_message.lines).to include(["TEXT","Partly cloudy for the hour."])
	end

	context "in the morning" do 

		before do 
			morning = Time.local(2014,10,23,11,31)
			Timecop.freeze(morning)
		end

		it "can add a morning greeting" do 
			morning_message.add_greeting
			expect(morning_message.lines).to include(["CENTREBIG","Good Morning"])
		end

		it "can add a time dependent message" do 
			morning_message.add_time_dependent_message
			expect(morning_message.lines).to include(["TEXT","This will be the calander"])
		end
	end


	context "in the afteernoon" do 

		before do 
			afternoon = Time.local(2014,10,23,16,31)
			Timecop.freeze(afternoon)
		end

		it "can add a afternoon greeting" do 
			afternoon_message.add_greeting
			expect(afternoon_message.lines).to include(["CENTREBIG","Good Afternoon"])
		end

		it "can add a time dependent message" do
			Forecast.any_instance.stub(summary: "Partly cloudy for the hour.") 
			afternoon_message.add_time_dependent_message
			expect(afternoon_message.lines).to include(["TEXT","Partly cloudy for the hour."])
		end
	end


end