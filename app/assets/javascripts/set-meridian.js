// Set meridian for better_am_pm gem
(function($, window, document, undefined){

  "use strict";

  function meridian (hour) {
    if ((hour >= 0) && (hour < 12)) {
      return 'am';
    } else if ((hour > 11) && (hour < 24)) {
      return 'pm';
    } else {
      return '';
    }
  };

  function set_meridian (event) {
    // console.log("Called set_meridian with ");
    // console.log(event.target);
    // TODO: How do we get the next meridian target?
    // console.log($(event.target).closest('.ampm-meridian'));
    var hour = $(event.target).find('.hour').val()
    $(event.target).closest('.ampm-meridian').text(meridian(hour));
  };

  $(document).ready(function () {
    $('.hour').on('change', set_meridian);
  });


}($, window, document));
