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
        console.log({ data });

        const messageElement = document.createElement("div");
        messageElement.innerHTML = data.message;
        const newMessage = messageElement.firstElementChild;

        // メッセージの送信者IDを取得
        const senderId = parseInt(newMessage.dataset.userId, 10);

        console.log({ senderId });
        console.log({ userId });

        // 自分が送信したメッセージなら「Read / Unread」表示
        if (senderId === parseInt(userId)) {
          const readStatusElement = newMessage.querySelector(".read-status");
          readStatusElement.innerHTML = `<p class="read_flag">Unread</p>`;
        }

        chatElement.appendChild(newMessage);
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
