// Teacher Batch action
$(document).on('click','#teacher_main_checkbox',function(){
  if($(this).is(':checked')){
    $('#teacher_batch').prop('disabled', false)
  }else {
    $('#teacher_batch').prop('disabled', true)
  }

})
$(document).on('click','#teacher_check_selection',function(){
  if($(this).is(':checked')){
    $('#teacher_batch').prop('disabled', false)
  }else {
    $('#teacher_batch').prop('disabled', true)
  }
})

// Parent batch action
// var batch_arr = new Array();
$(document).on('click','#main_checkbox',function(){
  if($(this).is(':checked')){
    $('#batch_action_kind').prop('disabled', false)
  }else {
    $('#batch_action_kind').prop('disabled', true)
  }

})
$(document).on('click','#check_box_selection',function(){
  if($(this).is(':checked')){
    $('#batch_action_kind').prop('disabled', false)
  }else {
    $('#batch_action_kind').prop('disabled', true)
  }
})

// $(document).on('change','#batch_action_kind',function(){
//   var batch_action = this.value
//   $.ajax({
//     type: "get",
//     url: "/batch_action_parent",
//     data:{batch_arr,batch_action}
//   })
// })

//Classroom batch action
$(document).on('click','#level_main_checkbox',function(){
  if($(this).is(':checked')){
    $('#level_batch').prop('disabled', false)
  }else {
    $('#level_batch').prop('disabled', true)
  }

})
$(document).on('click','#level_check_box',function(){
  // var checkboxes = $("input[type='checkbox']"),
  // select_opt = $("#level_batch");
  // select_opt.attr("disabled", !checkboxes.is(":checked"));
  if($(this).is(':checked')){
    $('#level_batch').prop('disabled', false)
  }else {
    $('#level_batch').prop('disabled', true)
  }

})

//Type batch action
$(document).on('click','#type_main_checkbox',function(){
  if($(this).is(':checked')){
    $('#type_batch').prop('disabled', false)
  }else {
    $('#type_batch').prop('disabled', true)
  }

})
$(document).on('click','#type_check_box',function(){
  // var checkboxes = $("input[type='checkbox']"),
  // select_opt = $("#type_batch");
  // select_opt.attr("disabled", !checkboxes.is(":checked"));
  if($(this).is(':checked')){
    $('#type_batch').prop('disabled', false)
  }else {
    $('#type_batch').prop('disabled', true)
  }
})

// For Batch action enabled disabled when check on all checkbox
$(document).on('click','#student_main_checkbox',function(){
  if($(this).is(':checked')){
    $('#student_batch').prop('disabled', false)
  }else {
    $('#student_batch').prop('disabled', true)
  }

})

// For Batch action enabled disabled when check on each checkbox
$(document).on('click','#student_check_box',function(){
  if($(this).is(':checked')){
    $('#student_batch').prop('disabled', false)
  }else {
    $('#student_batch').prop('disabled', true)
  }
})

// Attendance Batch action
$(document).on('click','#attendance_main_checkbox',function(){
  if($(this).is(':checked')){
    $('#attendance_bacth_action').prop('disabled', false)
  }else {
    $('#attendance_bacth_action').prop('disabled', true)
  }

})
$(document).on('click','#attendance_selection',function(){
  if($(this).is(':checked')){
    $('#attendance_bacth_action').prop('disabled', false)
  }else {
    $('#attendance_bacth_action').prop('disabled', true)
  }
})

// Event Batch action
$(document).on('click','#event_main_checkbox',function(){
  if($(this).is(':checked')){
    $('#event_batch').prop('disabled', false)
  }else {
    $('#event_batch').prop('disabled', true)
  }

})
$(document).on('click','#event_check_selection',function(){
  if($(this).is(':checked')){
    $('#event_batch').prop('disabled', false)
  }else {
    $('#event_batch').prop('disabled', true)
  }
})

  // Batch action modelpopup
  $( document ).ready(function() {
   $( "#student_batch" ).change(function() {
     var actions = this.value;
     // alert(actions);
      if(actions == 1)
        $('#gdprModal').modal('show')
      if(actions == 2)
        $('#emailModal').modal('show')
      if(actions == 3)
        $('#smsModal').modal('show')
       });
  });

  // For all status buttons
  $(".mb-1").click(function() {
   $(this).addClass('active');
   $(this).siblings("input").removeClass("active");
  });

// KeyEvent Batch action
$(document).on('click','#key_event_main_checkbox',function(){
  if($(this).is(':checked')){
    $('#Key_event_batch').prop('disabled', false)
  }else {
    $('#Key_event_batch').prop('disabled', true)
  }

})
$(document).on('click','#keyevent_check_selection',function(){
  if($(this).is(':checked')){
    $('#Key_event_batch').prop('disabled', false)
  }else {
    $('#Key_event_batch').prop('disabled', true)
  }
})

// Classroom days selection
$(document).on('change', '#level_classroom_type', function(ev) {
  if ($(ev.target).val() === 'weekdays') {
    $('#level_days_monday')[0].checked = true
    $('#level_days_tuesday')[0].checked = true
    $('#level_days_wednesday')[0].checked = true
    $('#level_days_thursday')[0].checked = true
    $('#level_days_friday')[0].checked = true
    $('#level_days_sunday')[0].checked = false
    $('#level_days_saturday')[0].checked = false
  }
  if ($(ev.target).val() === 'weekend') {
    $('#level_days_sunday')[0].checked = true
    $('#level_days_saturday')[0].checked = true
    $('#level_days_monday')[0].checked = false
    $('#level_days_tuesday')[0].checked = false
    $('#level_days_wednesday')[0].checked = false
    $('#level_days_thursday')[0].checked = false
    $('#level_days_friday')[0].checked = false
  }
});


$(document).on('click','.event_color',function(){
  $('#event_color_field').val(this.getAttribute("id"));
})
