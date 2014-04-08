module Spree
  module Api
    class Spree::Api::BaseController
      def campaign_scope
        if current_api_user.has_spree_role?("admin")
          scope = Campaign.accessible_by(current_ability, :read)
        else
          scope = Campaign.accessible_by(current_ability, :read).active
        end
        
        scope
      end
  
      def find_campaign(id)
        campaign_scope.find(id)
      end
    end
    
    class CampaignsController < Spree::Api::BaseController
      def index
        if params[:ids]
          @campaigns = campaign_scope.where(:id => params[:ids].split(","))
        else
          @campaigns = campaign_scope.ransack(params[:q]).result
        end
  
        #@campaigns = @campaigns.distinct.page(params[:page]).per(params[:per_page])
      end

      def show
        @campaign = find_campaign(params[:id])
        respond_with(@campaign)
      end
    end
  end
end
