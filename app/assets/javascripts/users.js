$(function(){
  $("form").submit(function(event){
    event.preventDefault();
    // this debugger should be hit when you click the submit button!
    // debugger;

    var action = $(this).attr('action');
    var method = $(this).attr('method');
    var name = $('input#user_name').val();

    // Format the form response data the way Rails likes it.
    var data = $(this).serializeArray();

    // Ajax POST
    $.ajax({
      method: method,
      url: action,
      data: data,

      // Forces change to response format
      dataType: 'script',
      // Clear the value out after submission
      success: function() {
        $('input#user_name').val(''); }
    });

  });
});
