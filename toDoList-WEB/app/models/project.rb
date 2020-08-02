class Project < ApplicationRecord
    has_many :todos
    accepts_nested_attributes_for :todos
end
