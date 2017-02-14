class FaqsController < ApplicationController
  # GET /faqs
  # GET /faqs.json
  def index
    @faqs = Faq.all
  end
end
