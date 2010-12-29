# Specification Test for main application controller.

require 'rspec/expectations'
# JJM Note: Markus mentioned we should use Mocha with rspec
require 'hello_world'

describe "HelloWorld.new" do
  it "should accept an alternate argument vector" do
    HelloWorld.new(["arg1", "arg2", "arg3"]).should be_an_instance_of(HelloWorld)
  end
end

describe "HelloWorld" do
  # before :all creates a new instance of the applicatio ONCE.
  # @app is then available to all behavior tests.
  # Alternatively, before :each will execute before each test.
  before :all do
    @app = HelloWorld.new(["arg1", "arg2", "arg3"])
  end

  describe "run" do
    it "should print Hello World" do
      # JJM Based on discussions with Markus, there should
      # be a better way to mock out I/O and System calls.
      # Problems with STDOUT.should_receive are:
      # - Doesn't Scale.
      # - Doesn't handle multiple ways to print output.  e.g. logging,
      #   puts, etc..
      # The proposed idea to investigate is to shim the desired behavior
      # like Puppet::Utils#exec does.  Then, we mock Puppet::Utils#exec
      STDOUT.should_receive(:print).with("Hello World!\n")
      STDOUT.should_receive(:print)
      @app.run
    end

    it "should print arguments passed in" do
      STDOUT.should_receive(:print)
      STDOUT.should_receive(:print).with("Arguments: arg1, arg2, arg3\n")
      @app.run
    end
  end
end
