class House < ActiveRecord::Base
    has_many :people,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: "Person"

    has_many :residents,
        through: :people,
        source: people
end