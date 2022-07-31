import consumer from "./consumer"

let url = window.location.href
let room_id = parseInt( url.substring(url.search("rooms/") + 6) );

if(url.indexOf("rooms/") != -1){
  consumer.subscriptions.create({"channel": "RoomChannel", "room_id": room_id}, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      document.querySelector("ul#messages").insertAdjacentHTML("beforeend",
      '$(data.content)')
      // Called when there's incoming data on the websocket for this channel
    }
  });
}
