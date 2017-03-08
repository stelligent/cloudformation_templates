require 'aws-sdk'

client = Aws::SSM::Client.new(region: 'us-east-1')
resp = client.get_parameters({
  names: ["HostedZoneName", "Password"], # required
  with_decryption: true,
})

hostedzonename = resp.parameters[0].value
password = resp.parameters[1].value
 
file_names = ['sample_ssm_config.json']

file_names.each do |file_name|
  text = File.read(file_name)

  # Display text for usability
  puts text


  # Substitute Variables
  new_contents = text.gsub(/HOSTEDZONE/, hostedzonename)
  new_contents = new_contents.gsub(/PASSWORD/, password)


  # To write changes to the file, use:
  File.open(file_name, "w") {|file| file.puts new_contents.to_s }
end
