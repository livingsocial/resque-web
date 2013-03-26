// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(function() {
  var poll_interval = 2

  var relatizer = function(){
    var dt = $(this).text();
    $(this).relativeDate();
    var relatized = $(this).text();
    
    if ($(this).parents("a").length > 0 || $(this).is("a")) {
      $(this).relativeDate()
      if (!$(this).attr('title')) {
        $(this).attr('title', dt)
      }
    } else {
      $(this)
        .text('')
        .append( $('<a href="#" class="toggle_format" title="' + dt + '" />')
        .append('<span class="date_time">' + dt +
                '</span><span class="relatized_time">' +
                relatized + '</span>') )
    }
  };

  $('.time').each(relatizer);

  $('.time a.toggle_format .date_time').hide()

  var format_toggler = function(){
    $('.time a.toggle_format span').toggle()
    $(this).attr('title', $('span:hidden',this).text())
    return false
  };

  $('.time a.toggle_format').click(format_toggler);

  $('.backtrace').click(function() {
    $(this).next().toggle()
    return false
  })

  var poll_start = function(el) {
    var href = el.attr('href')
    el.parent().text('Starting...')
    $("#main").addClass('polling')

    setInterval(function() {
      $.ajax({dataType: 'text', type: 'get', url: href, success: function(data) {
        $('#main').html(data)
        $('#main .time').relativeDate()
      }})
    }, poll_interval * 1000)

    location.hash = '#poll'

    return false
  };

  if (location.hash == '#poll') poll_start($('a[rel=poll]'))

  $('a[rel=poll]').click(function() { return poll_start($(this)) })

  $('ul.failed li').hover(function() {
    $(this).addClass('hover');
  }, function() {
    $(this).removeClass('hover');
  })

  $('ul.failed a[rel=retry]').click(function() {
    var href = $(this).attr('href');
    $(this).text('Retrying...');
    var parent = $(this).parent();
    $.ajax({dataType: 'text', type: 'get', url: href, success: function(data) {
      parent.html('Retried <b><span class="time">' + data + '</span></b>');
      relatizer.apply($('.time', parent));
      $('.date_time', parent).hide();
      $('a.toggle_format span', parent).click(format_toggler);
    }});
    return false;
  })

  $('#clear-failed-jobs').click(function(){
    return confirm('Are you sure you want to clear ALL failed jobs?');
  })

  $('#retry-failed-jobs').click(function(){
    return confirm('Are you sure you want to retry ALL failed jobs?');
  })
})
