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
get "/test" do
  erb :Home
=======
libs = Dir.entries("uploads")
libs.shift(2)
libs.map { |x| x.chomp!(".txt") }

get "/:name" do |name|
  p name
  erb :madlib
>>>>>>> dce29c13660a7b3cb2fd79999b063e18c027fe24
end
