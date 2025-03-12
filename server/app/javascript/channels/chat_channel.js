import consumer from "./consumer";

document.addEventListener("turbo:load", () => {
  const chatElement = document.getElementById("messages");
  if (!chatElement) return;

  console.log(chatElement);

  const chatId = chatElement.dataset.chatId;
  const userId = parseInt(chatElement.dataset.userId, 10);

  const chatChannel = consumer.subscriptions.create(
    { channel: "ChatChannel", chat_id: chatId, user_id: userId },
    {
      received(data) {
        console.log({ data });

        if (data.type === "update_read_status") {
          const lastReadMessageId = parseInt(data.last_read_message_id);
          const readerId = parseInt(data.reader_id);
          updateReadStatus(lastReadMessageId, readerId, userId);
        } else if (data.type === "new_message") {
          appendNewMessage(data);
          notifyMessageRead();
        } else {
          console.log("Other case!");
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
      console.log(
        `User ${readerUserId} has opened messages up to ${lastReadMessageId}`
      );

      document.querySelectorAll(".message").forEach((element) => {
        const messageId = parseInt(element.dataset.messageId, 10);
        const readFlag = element.querySelector(".read-flag");

        if (messageId <= lastReadMessageId && readFlag) {
          readFlag.innerText = "Read";
          readFlag.dataset.status = "read";
        }
      });
    } else {
      console.log("Updated last read message for current user.");
    }
  }

  function appendNewMessage(data) {
    const newMessage = data.html_content;
    const senderId = parseInt(data.sender_id, 10);
    chatElement.insertAdjacentHTML("beforeend", newMessage);
    const newMessageElement = chatElement.lastElementChild;

    if (senderId === userId) {
      const readStatusElement = document.createElement("div");
      readStatusElement.classList.add("read-status");
      readStatusElement.innerHTML = `<p class="read-flag">Unread</p>`;
      newMessageElement.appendChild(readStatusElement);
    }
  }

  function notifyMessageRead() {
    const lastMessage = document.querySelector("#messages .message:last-child");
    if (!lastMessage) return;

    const lastMessageId = parseInt(lastMessage.dataset.messageId, 10);
    console.log(`Notifying server: Read up to message ${lastMessageId}`);

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
