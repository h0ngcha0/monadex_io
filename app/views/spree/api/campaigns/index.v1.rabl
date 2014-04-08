object false
node(:count) { @campaigns.count }
child(@campaigns => :campaigns) do
  extends "spree/api/campaigns/show"
end
