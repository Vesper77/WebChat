App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        $("#messages").removeClass('hidden')
        return $('#message-area').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
});