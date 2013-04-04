var Answer = {
  init: function() {
    $('form.new_answer').on('ajax:success', this.appendAnswer);
    $('form.new_answer').on('ajax:success', this.clearTextArea);
    $('form.new_answer').on('ajax:error', this.showErrors);
    $('.answers').on('click', 'a.delete', this.confirmDelete);
    $('.answers').on('ajax:success', 'a.delete', this.deleteAnswer);
  },
    
  appendAnswer: function(event, data) {
    $('li#answer_errors').hide();
    $('ul.answers').append('<li>' + data.content + '</li>');
    $('ul.answers').append('Posted by: ' + data.user_id);                         
  },

  showErrors: function(xhr, data, status) {
    if (data.statusText == "Unauthorized") return window.location = data.responseText
      $('ul.answers').before("<li id='answer_errors'>" + data.responseText + "</li>");
  },

  confirmDelete: function() {
    if (!confirm("Are you sure you want to delete this answer?")) return false;
  },

  clearTextArea: function() {
    $('textarea#answer_content').val("");
  },

  deleteAnswer: function() {
    $(this).parent('li').hide('slow');
  }
}

$(document).ready(function() {
  Answer.init();
});
