# Hello World Application Controller
#

class HelloWorld

  def initialize(argv)
    @argv = argv
  end

  def run
    STDOUT.print "Hello World!\n"
    STDOUT.print "Arguments: #{@argv.join(", ")}\n"
  end

end
