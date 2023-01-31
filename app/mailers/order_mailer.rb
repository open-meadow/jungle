class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt
    @order = params[:order]
    @url = 'http://localhost:3000/orders/:id'
    mail(to: @order.email, subject: "Order no #{@order.id}")
  end

end
