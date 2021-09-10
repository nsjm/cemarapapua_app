if ($('#msg_pesan').length){
  msg_pesan($("#msg_pesan").attr('data'),$("#msg_pesan").attr('alt'));
}

function msg_pesan(meseg,jenis_icon){

  var n = noty({
    layout: 'center',
    theme: 'bootstrapTheme', // or relax
    type: `${jenis_icon}`, // success, error, warning, information, notification
    text: `${meseg}`, // [string|html] can be HTML or STRING

    dismissQueue: true, // [boolean] If you want to use queue feature set this true
    force: false, // [boolean] adds notification to the beginning of queue when set to true
    maxVisible: 5, // [integer] you can set max visible notification count for dismissQueue true option,

    template: '<div class="noty_message"><span class="noty_text"></span><div class="noty_close"></div></div>',

    timeout: 1500, // [integer|boolean] delay for closing event in milliseconds. Set false for sticky notifications
    progressBar: true, // [boolean] - displays a progress bar

    animation: {
      open: {height: 'toggle'}, // or Animate.css class names like: 'animated bounceInLeft'
      close: {height: 'toggle'}, // or Animate.css class names like: 'animated bounceOutLeft'
      easing: 'swing',
      speed: 100 // opening & closing animation speed
    },
    closeWith: ['backdrop'], // ['click', 'button', 'hover', 'backdrop'] // backdrop click will close all notifications

    modal: false, // [boolean] if true adds an overlay
    killer: false, // [boolean] if true closes all notifications and shows itself

    buttons: false // [boolean|array] an array of buttons, for creating confirmation dialogs.
  });
  n.show();
}