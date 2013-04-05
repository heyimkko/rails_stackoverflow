var Question = {
  init: function() {
    $('.questions').on('click', 'a.icon-remove', this.confirmDelete);
    $('.questions').on('ajax:success', 'a.icon-remove', this.deleteQuestion);
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
