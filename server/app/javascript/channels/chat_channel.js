import consumer from "./consumer";

document.addEventListener("turbo:load", () => {
  const chatElement = document.getElementById("messages");
  if (!chatElement) return;

  const chatId = chatElement.dataset.chatId;
  const userId = parseInt(chatElement.dataset.userId, 10);

  const chatChannel = consumer.subscriptions.create(
    { channel: "ChatChannel", chat_id: chatId, user_id: userId },
    {
      received(data) {
        if (data.type === "update_read_status") {
          const lastReadMessageId = parseInt(data.last_read_message_id);
          const readerId = parseInt(data.reader_id);
          updateReadStatus(lastReadMessageId, readerId, userId);
        } else if (data.type === "new_message") {
          appendNewMessage(data);
          notifyMessageRead();
        }
      },

      connected() {
        fetch(`/chats/${chatId}/load_messages`)
          .then((response) => response.text())
          .then((messages) => {
            chatElement.innerHTML = messages;
          })
          .then(() => {
            notifyMessageRead();
          });
      },
    }
  );

  function updateReadStatus(lastReadMessageId, readerUserId, currentUserId) {
    if (readerUserId !== currentUserId) {
      document.querySelectorAll(".message").forEach((element) => {
        const messageId = parseInt(element.dataset.messageId, 10);
        const readFlag = element.querySelector(".read-flag");

        if (messageId <= lastReadMessageId && readFlag) {
          readFlag.innerText = "Read";
          readFlag.dataset.status = "read";
        }
      });
    }
  }

  function appendNewMessage(data) {
    chatElement.insertAdjacentHTML("beforeend", data.html_content);
    const newMessageElement = chatElement.lastElementChild;

    const senderId = parseInt(data.sender_id, 10);
    if (senderId === userId) {
      newMessageElement.appendChild(readStatusElement());
    }

    function readStatusElement() {
      const result = document.createElement("div");
      result.classList.add("read-status");
      result.innerHTML = `<p class="read-flag">Unread</p>`;

      return result;
    }
  }

  function notifyMessageRead() {
    const lastMessage = document.querySelector("#messages .message:last-child");
    if (!lastMessage) return;

    const lastMessageId = parseInt(lastMessage.dataset.messageId, 10);

    chatChannel.perform("mark_as_read", {
      chat_id: chatId,
      reader_id: userId,
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
