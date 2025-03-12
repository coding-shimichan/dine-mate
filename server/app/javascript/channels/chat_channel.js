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

        if (data.type === "update_read_status") {
          updateReadStatus(data.last_read_message_id, data.user_id, userId);
        } else {
          const messageElement = document.createElement("div");
          messageElement.innerHTML = data.message;
          const newMessage = messageElement.firstElementChild;

          const senderId = parseInt(newMessage.dataset.userId, 10);

          console.log({ senderId });
          console.log({ userId });

          if (senderId === parseInt(userId)) {
            const readStatusElement = newMessage.querySelector(".read-status");
            readStatusElement.innerHTML = `<p class="read_flag">Unread</p>`;
          }

          chatElement.appendChild(newMessage);

          notifyMessageRead();
        }
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

  function updateReadStatus(lastReadMessageId, readerUserId, currentUserId) {
    if (readerUserId !== currentUserId) {
      console.log(
        "Message sent by current user has been opened by other user."
      );

      // document.querySelectorAll(".read-status").forEach((element) => {
      document.querySelectorAll(".message").forEach((element) => {
        const messageId = parseInt(element.dataset.messageId, 10);
        const readFlag = element.querySelector(".read_flag");

        if (messageId <= lastReadMessageId && readFlag) {
          readFlag.innerText = "Read";
          readFlag.dataset.status = "read";
        }
      });
    } else {
      console.log("Message is not sent by current user.");
    }
  }

  function notifyMessageRead() {
    const lastMessage = document.querySelector("#messages .message:last-child");
    if (!lastMessage) return;

    const lastMessageId = parseInt(lastMessage.dataset.messageId, 10);
    console.log(`Notifying server: Read up to message ${lastMessageId}`);

    chatChannel.perform("mark_as_read", {
      chat_id: chatId,
      user_id: userId,
      last_read_message_id: lastMessageId,
    });
  }

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
