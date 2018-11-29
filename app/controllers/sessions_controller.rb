class SessionsController < Devise::SessionsController

   # DELETE /resource/sign_out
   def destroy
      super
      current_cart
   end

end