xml.error do
  xml.message error.message
  if error.respond_to? :details
    xml.details do
      error.details.each { |detail| xml.detail detail }
    end
  end
end
