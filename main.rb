require "sinatra"

get "/" do
end

get "/upload" do
  @title = "File uploader"
  erb :upload
end

post "/upload" do
  File.open("uploads/" + params["myfile"][:filename], "w") do |f|
    f.write(params["myfile"][:tempfile].read)
  end
  return "The file was successfully uploaded!"
end

<<<<<<< HEAD
get "/:name" do |name|
  @name = name
  libs = Dir.entries("uploads")
  libs.shift(2)
  libs.map { |x| x.chomp!(".txt") }

  @words = nil
  if (libs.include?(name))
    File.open("uploads/#{name}.txt", "r") do |f|
      data = f.read
      data = data.slice(/\[.*\]/) # ignore any text before the first required word and after the last
      data = data[1...data.size - 1] # remove the first ] and last [
      data = data.split(/\].*?\[/) # turn data into an array of the needed words
      @words = data
      p @words
    end
    return erb :madlib
  end
  return "How did you get here? You should have just clicked a link. Unless we messed up"
=======
libs = Dir.entries("uploads")
libs.shift(2)
libs.map { |x| x.chomp!(".txt") }

@words = []

get "/testing" do
  @words = ["verb", "adjective", "noun", "verb"]
  erb :madlib
>>>>>>> Got form thing done
end
Combined = []

post "/testing" do
  i = 1
  l = params.size
  until i > l
    message = "message#{i}"
    p params[message.to_sym]
    Combined << params[message.to_sym]
    i += 1
  end
  Combined.join("<br>")
end
