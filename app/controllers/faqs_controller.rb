# frozen_string_literal: true

class FaqsController < ApplicationController
  # GET /faqs
  # GET /faqs.json
  def index
    @faqs = Faq.all
  end
end
