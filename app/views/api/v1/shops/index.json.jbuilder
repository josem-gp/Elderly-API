json.array! @shops do |shop|
  json.extract! shop, :id, :name, :address, :phone_number, :website, :images
end
