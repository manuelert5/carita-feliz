

$(function () { 
    var $popover = $('.popover-markup>.trigger').popover({
      html: true,
      placement: 'bottom',
      // title: '<?= lang("Select passengers");?><a class="close demise");">×</a>',
      content: function () {
          return $(this).parent().find('.content').html();
      }
    });

    // open popover & inital value in form
    var passengers = [1,0,0];
    $('.popover-markup>.trigger').click(function (e) {
        e.stopPropagation();
        $(".popover-content input").each(function(i) {
            $(this).val(passengers[i]);
        });
    });
    // close popover
    $(document).click(function (e) {
        if ($(e.target).is('.demise')) {        
            $('.popover-markup>.trigger').popover('hide');
        }
    });
// store form value when popover closed
 $popover.on('hide.bs.popover', function () {
    $(".popover-content input").each(function(i) {
        passengers[i] = $(this).val();
    });
  });
    // spinner(+-btn to change value) & total to parent input 
    $(document).on('click', '.number-spinner a', function () {
        var btn = $(this),
        input = btn.closest('.number-spinner').find('input'),
        total = $('#passengers').val(),
        oldValue = input.val().trim();

    if (btn.attr('data-dir') == 'up') {
      if(oldValue < input.attr('max')){
        oldValue++;
        total++;
      }
    } else {
      if (oldValue > input.attr('min')) {
        oldValue--;
        total--;
      }
    }
    $('#passengers').val(total);
    input.val(oldValue);
  });
  $(".popover-markup>.trigger").popover('show');
});

