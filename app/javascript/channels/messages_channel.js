import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
  consumer.subscriptions.create({
    channel: "MessagesChannel",
    cartId: $('#messages').attr('data-cart-id')
    }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      $("#messages").append(data.html);
    }
  });  
})



