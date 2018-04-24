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
    end
    return erb :madlib
  end
  return "How did you get here? You should have just clicked a link. Unless we messed up"
end

post "/:name" do |name|
  libs = Dir.entries("uploads")
  libs.shift(2)
  libs.map { |x| x.chomp!(".txt") }

  madlib = nil
  if (libs.include?(name))
    data = nil
    File.open("uploads/#{name}.txt", "r") do |f|
      data = f.read
      data = data.split(/(\[.*?\])/)
    end

    madlib = ""
    i = 0
    data.each do |d|
      if (d.start_with?("[") && d.end_with?("]"))
        madlib += params["message#{i}".to_sym]
        i += 1
      else
        madlib += d
      end
    end
    # Combined = []
    # i = 1
    # l = params.size
    # until i > l
    #   message = "message#{i}"
    #   Combined << params[message.to_sym]
    #   i += 1
    # end
  else
    return "I actually don't know how you got here. Good job, you broke my code"
  end
  return madlib
end
