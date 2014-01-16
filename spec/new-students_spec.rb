require './new-students.rb'

describe "Student Directory" do
	it "should bring up menu" do
		directory = StudentDirectory.new
		expect(directory).to receive(:try_load_students).once
		expect(directory).to receive(:print_menu).once
		STDIN.stub(:gets).and_return("9\n")		
		expect(directory).to receive(:process).with("9") { exit }
		expect { directory.interactive_menu }.to raise_error SystemExit
	end

end

