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

libs = Dir.entries("uploads")
libs.shift(2)
# libs.map { |x| x = x[0..x.length - 4] }
p libs

get "/:name" do |name|
  return erb :madlib
end
