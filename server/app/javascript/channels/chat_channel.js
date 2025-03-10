import consumer from "./consumer";

document.addEventListener("turbo:load", () => {
  const chatElement = document.getElementById("messages");
  if (!chatElement) return;

  console.log(chatElement);

  const chatId = chatElement.dataset.chatId;
  const userId = chatElement.dataset.userId;

  const chatChannel = consumer.subscriptions.create(
    { channel: "ChatChannel", chat_id: chatId, user_id: userId },
    {
      received(data) {
        chatElement.insertAdjacentHTML("beforeend", data.message);
      },

      connected() {
        fetch(`/chats/${chatId}/load_messages`)
          .then((response) => response.text())
          .then((messages) => {
            chatElement.innerHTML = messages;
          });
      },
    }
  );

  document
    .getElementById("message-form")
    .addEventListener("submit", (event) => {
      event.preventDefault();
      const input = document.getElementById("message-input");
      chatChannel.send({
        content: input.value,
        chat_id: chatId,
        user_id: userId,
      });
      input.value = "";
    });
});
