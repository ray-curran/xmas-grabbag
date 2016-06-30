class PairSerializer < ActiveModel::Serializer
  attributes :id, :giver_id, :recipient_id, :trade_id
end