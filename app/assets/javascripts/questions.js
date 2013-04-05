var Question = {
  init: function() {
    $('.questions').on('click', 'a.delete', this.confirmDelete);
    $('.questions').on('ajax:success', 'a.delete', this.deleteQuestion);
  },

  confirmDelete: function() {
    if (!confirm("Are you sure you want to delete this question?")) return false;
  },

  deleteQuestion: function() {
    $(this).parent('li').hide('slow');
  }
}

$(document).ready(function() {
  Question.init();
});
