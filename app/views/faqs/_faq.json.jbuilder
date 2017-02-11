json.extract! faq, :id, :title, :answer, :created_at, :updated_at
json.url faq_url(faq, format: :json)
