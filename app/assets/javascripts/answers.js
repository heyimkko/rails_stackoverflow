var Answer = {
  init:function() {
    $('form.new_answer').on('ajax:success', this.appendAnswer);
    $('form.new_answer').on('ajax:error', this.showErrors);
  },
    
  appendAnswer: function(event, data) {
    $('ul.answers').append('<li>' + data.content + '</li>');
  },

  showErrors: function(xhr, data, status) {
    if (data.statusText == "Unauthorized") return window.location = data.responseText
      $('ul.answers').before(data.responseText);
  }
}

$(document).ready(function() {
  Answer.init();
})
