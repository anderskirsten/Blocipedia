class DowngradeController < ApplicationController
  def new
  end

  def create
    
    refund = Stripe::Refund.create( charge: current_user.charge_id )
    
    if refund.status == 'succeeded'
        current_user.update(role: 0)

        flash[:notice] = "Your account has been downgraded to Standard Membership. Your private wikis are now public and you will recieve a $15.00 refund."
        redirect_to new_charge_path
    else
        flash[:alert] = "There was an error downgrading the membership. Please try again."
        redirect_to new_charge_path
    end
  end
end
