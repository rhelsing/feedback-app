var MyFeedbacks = (function(){
  $(document).on('click', '#my-feedbacks', function(){
    var val = $(this).closest('#search').find('input').val());
    location.replace('/my_feedbacks/' + val;
  });

  $(document).on('click', '#new-feedback', function(){
    var val = $(this).closest('#search').find('input').val());
    location.replace('/feedbacks/new?token=' + val;
  });
})();
