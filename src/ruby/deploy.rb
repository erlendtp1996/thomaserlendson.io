require 'aws-sdk-s3'
require 'dotenv'

Dotenv.load("../../.env")
files = Dir["../../web/*"]

client = Aws::S3::Client.new

for file in files 
    fileData = File.open(file).read
    client.put_object({
        body: fileData,
        bucket: ENV["BUCKET_NAME"],
        key: file.split("/")[-1],
        content_type: "text/html"
    });
end
