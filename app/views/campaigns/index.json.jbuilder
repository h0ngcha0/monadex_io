json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :title, :description, :url, :due_date, :target_num, :product_id
  json.url campaign_url(campaign, format: :json)
end
