# frozen_string_literal: true

json.extract! challenge, :name, :category, :solutions_count
json.name challenge.slug
json.category challenge.category.slug
