# frozen_string_literal: true

# This is the application record that extends activerecord
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
