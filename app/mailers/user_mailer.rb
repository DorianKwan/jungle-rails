class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    mail(to: @user.email, subject: "Order #{@order.id} Confirmation from Jungle")
end
