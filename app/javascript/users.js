/* global $, Stripe */

$(document).on('turbolins:load', function(){
    var theForm = $('#pro_form')
    var submitBtn = $('#form-submit-btn')
    submitBtn.click(function(event){
        event.preventDefault();
    });
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();

    Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
    }, stripeResponseHandler);

    Stripe.setPunlishableKey($('meta[name="stripe-key').attr('content'));   
});
