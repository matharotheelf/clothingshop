# frozen_string_literal: true

class BasketItem < ApplicationRecord
  alias_attribute :category, :string
end
