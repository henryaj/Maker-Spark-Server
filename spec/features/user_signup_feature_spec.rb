feature "User sign up" do

	before do 
		stub_request(:any, "https://github.com/users/byverdu/contributions")
	end

	context "a new user" do 

    scenario "visiting the 'sign up with' page without an RFID code redirects to the homepage and displays a notice about how to sign up" do
      visit '/users/sign_up_with'
      expect(page).to have_content("Thanks for your interest in Spark Printer. Please visit the printer and tap an RFID card on the reader to get your unique signup code.")
      expect(current_path).to eq('/')
    end

    scenario "visiting the 'sign up' page redirects to the homepage and displays a notice about how to sign up" do
      visit '/users/sign_up'
      expect(page).to have_content("Thanks for your interest in Spark Printer. Please visit the printer and tap an RFID card on the reader to get your unique signup code.")
      expect(current_path).to eq('/')
    end

		scenario "when visiting the home page a sign up form is displayed" do
			visit '/users/sign_up_with/aabbccdd'
			expect(page).to have_selector("form.sign_up")
		end
		
		scenario "the form has the correct fields" do
			visit '/users/sign_up_with/aabbccdd'
			expect(page).to have_selector("input[name=email]")
			expect(page).to have_selector("input[name=github_user]")
			expect(page).to have_selector("input[name=password]")
			expect(page).to have_selector("input[name=password_confirmation]")
			expect(page).to have_button("Sign up")
    end

    scenario "The user can sign up" do
    		visit '/users/sign_up_with/aabbccdd'
			expect{ sign_up }.to change(User, :count).by(1)
			expect(current_path).to eq('/')
			expect(page).to have_content('Thank you for registering, byverdu@test.com')
			expect(page).to have_button('Log out')
			expect(page).to have_link('Edit account')
			expect(page).not_to have_link('Sign up')
			expect(page).not_to have_link('Sign in')
    	end

    	scenario "the user can pass his rfid_code with the url" do

    		visit '/users/sign_up/41d21cd'

    		sign_up
    		expect(current_path).to eq('/')
    		expect(page).to have_content('Thank you for registering, byverdu@test.com')
    	end

    	scenario "clicking on Home button leads to the home page" do
			visit "/users/sign_up"
			expect(page).to have_link('Spark Printer Dashboard')
			click_link('Spark Printer Dashboard')
			expect(current_path).to eq('/')
		end
	end

  context "an existing user" do
    before do
      stub_request(:any, "https://github.com/users/byverdu/contributions")
      sign_up
      sign_in
    end

    scenario "sees an error when accessing the signup form" do
      visit('/users/sign_up_with/aabbccdd')
      expect(page).to have_content("You're already a registered user!")
      expect(current_path).to eq('/')
    end
  end

end


