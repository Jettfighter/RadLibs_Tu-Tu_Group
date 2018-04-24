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

get "/test" do
  erb :Home
end

get "/home" do
end

libs = Dir.entries("uploads")
libs.shift(2)
libs.map { |x| x.chomp!(".txt") }

get "/:name" do |name|
  p name
  erb :madlib
end
