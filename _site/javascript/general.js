//************************ General JS ***/

//************************ Fix for console errors ***/
if (!window.console || !console.firebug) {
	var names = ["log", "debug", "info", "warn", "error", "assert", "dir", "dirxml", "group", "groupEnd", "time", "timeEnd", "count", "trace", "profile", "profileEnd"];
	window.console = {};
	for (var i = 0; i < names.length; ++i) window.console[names[i]] = function() {}
}


//************************ Base URL ***/
function base_url(){
	var domain = 'http://'+window.location.hostname,
			subsite = window.location.pathname.match(/(\/.+?(?=\/))?/g)[0],
			theme = '/wp-content/themes/theme';
	var base_url = domain == 'http://dev.local' ? domain+subsite+theme : domain+theme;
	return base_url;
}


//************************ js class for enabled JS ***/
$('html').addClass('js');

//************************ Content choosers ***/
$(function(){
  
  //************************ Top content chooser ***/
  $('#personal').find('li').click(function(){
    var $el_class = $(this).attr('class').split(' ')[0];
    var $el_slide = $('div.'+$el_class);
    if ($el_slide.is(':hidden')) {
      $(this).addClass('active').siblings().removeClass('active');
      if ($el_slide.siblings('.top-slides').is(':visible')) {
        $el_slide.siblings('.top-slides:visible').removeClass('active').slideUp(300,function(){ $el_slide.addClass('active').slideDown(); });
      } else {
        $el_slide.addClass('active').slideDown();
      }
    } else {
      $(this).removeClass('active');
      $el_slide.removeClass('active').slideUp();
    }
    return false;
  });
  
  //************************ Picks list content chooser ***/
  $('#filter').find('.picks-chooser .type li').click(function(){
    var $el_class = $(this).attr('class').split(' ')[0];
    var $el_slide = $('div.'+$el_class);
    if ($el_slide.is(':hidden') || $('#venue .posts').is(':hidden')) {
      $('#venue .posts').show();
      $(this).addClass('active').siblings().removeClass('active');
      $el_slide.addClass('active').show().siblings('.picks-list').removeClass('active').hide();
    }
    return false;
  });
  
  $('#filter').find('.picks-list .close').click(function(){
    var $parent_class = $(this).closest('.picks-list').attr('class').split(' ')[0];
    $(this).closest('.picks-list').hide();
    $('#venue .posts').hide();
    $('#filter').find('.picks-chooser .type .'+$parent_class+', .picks-list.'+$parent_class).removeClass('active');
    return false;
  });
  
  $('#filter').find('.picks-list > ul li a').live('click',function(){
    var $parent_class = $(this).closest('.picks-list').attr('class').split(' ')[0];
    var $content_type = $parent_class.split('-')[1];
    var $el_text = $(this).text();
    if ($('#venue .posts .map').is(':hidden')) {
      $('#venue .posts .map').show();
    }
    $('#venue .posts ul li .'+$content_type+':contains('+$el_text+')').closest('li').show();
    $('.picked.'+$parent_class).append('<li><span>'+$el_text+'</span> <a href="#" class="remove">Remove</a></li>');
    $(this).parent().remove();
    return false;
  });
  
  $('#filter').find('.picked .remove').live('click',function(){
    var $parent_class = $(this).closest('.picked').attr('class').split(' ')[0];
    var $content_type = $parent_class.split('-')[1];
    var $el_text = $(this).siblings('span').text();
    $('#venue .posts ul li .'+$content_type+':contains('+$el_text+')').closest('li').hide();
    $('<li><a href="#">'+$el_text+'</a></li>').insertBefore('.picks-list.'+$parent_class+' > ul .close');
    $(this).closest('li').remove();
    return false;
  });
  
  $('#filter').find('.picked').each(function(){
    var $parent_class = $(this).attr('class').split(' ')[0];
    var $tab_width = parseInt($('#filter').find('.type li.'+$parent_class).outerWidth(true));
    $(this).css('width',$tab_width);
  });
      
});


//************************ IE6-7 ***/
$(function(){

  if(typeof document.body.style.content === 'undefined') {

    //************************ Create debugger for IE ***/
    //$('body').prepend('<div id="ie-debugger">IE Debugger</div>');
  
    //************************ Emulate CSS :after and content for IE6-7 for printing ***/
    if (window.onbeforeprint !== 'undefined') {
      window.onbeforeprint = ShowLinks;
      window.onafterprint = HideLinks;
    }
    function ShowLinks() {
      $('#content a[href]').each(function() {
        $(this).data('linkText', $(this).text());
        switch(''+$(this).attr('href').match(/mailto:|http:\/\//gi)) {
          case 'http://': $(this).append(' (' + $(this).attr("href") + ')'); break;
          case 'mailto:': break;
          default: $(this).append(' ('+ (''+window.location).match(/http:\/\/.+?\//gi) +'' + $(this).attr("href") + ')');
        }
      });
    }
    function HideLinks() {
      $('#content a[href]').each(function() {
        $(this).text($(this).data('linkText'));
      });
    }
   
  }
 
});

//************************ Create console for IE ***/
function consoleIE(el){
  $('#ie-debugger').html(el);
}