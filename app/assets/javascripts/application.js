// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-ui/datepicker
//= require jquery-ui/sortable
//= require jquery-ui/effect-highlight
//= require jquery.turbolinks
//= require touch-punch
//= require bootstrap
//= require turbolinks
//= require_tree .

$(function() {
    $( "#sortable" ).sortable({
        handle: ".mover"
    });
});


$(function(){
    $('.table tr[data-href]').each(function(){
        $(this).css('cursor','pointer').hover(
            function(){
                $(this).addClass('active');
            },  
            function(){
                $(this).removeClass('active'); 
            }).click( function(){ 
                document.location = $(this).attr('data-href'); 
            }
        );
    });
    //$("#datepicker").datepicker();
    //$('#addPeriodSubmit').addClass('disabled', 'disabled');
});


$(document).ready(function() {
    $('#clear-link').on('click', function (event) {
        event.preventDefault();
        $('#periodDesc').val('');
        $('#periodDur').val('');
        $('#periodDesc').focus();
    });
});
$(document).ready(function() {

    $('.editPeriodLink').on('click', function (event) {
        event.preventDefault();
        var periodId = +$(this).closest('tr').data('item-id');
        //alert(periodId);
    });
    $('#editPeriodModal').on('show.bs.modal', function(event) {
        var row = $(event.relatedTarget).closest('tr')
        var periodId = row.data('item-id')
        var description = row.find('.desc').text()
        var duration = row.find('.dur').text()

        var modal = $(this)
        modal.find('#description').val(description)
        modal.find('#dur').val(duration)
    });

    setTimeout(function() {
        $('#flash').remove();
    }, 5000);

    $('#addPeriodSubmit').on('click', function(event) {
        event.preventDefault();
        event.returnValue = false;
        //alert('Clicked it!')

        var form = $(this).parent()
        
            // if everything checks out
            // if duration is numerical
        if ( jQuery.isNumeric( $('#periodDur').val() ) ) {
            
            form.submit();

        } else {
            // set field style to has-error
            $('#periodDur').parent().addClass('has-error');
            
            // show the error message
            $('#durationAlert').show();
        }
    });
});









