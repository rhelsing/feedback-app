var MyFeedbacks = (function(){

  $(document).on('click', '#my-feedbacks', function(){
    var val = $(this).closest('#nav').find('input').val();
    location.replace('/my_feedbacks/' + val);
  });

  $(document).on('click', '#new-feedback', function(){
    var val = $(this).closest('#nav').find('input').val();
    location.replace('/feedbacks/new?token=' + val);
  });

  $(document).on('keyup', '#nav input', function(){
    var token = $(this).val();
    $("#feedback_token").val(token);
  });

  $(document).on('turbolinks:load', function(){
    var token = $("#nav input").val();
    $("#feedback_token").val(token);
  });

})();
