<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="static/slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/mycss.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="static/slick/slick.js"></script>
</head>
<body>
<div class="slider">
<div><img data-lazy="static/picture//IMG_3650.JPG"></div>
<div><img data-lazy="static/picture//IMG_3651.JPG"></div>
<div><img data-lazy="static/picture//IMG_3652.JPG"></div>
</div>
</body>
<script>
$(function(){
  var rewiteImageList = function() {
    var defer = $.Deferred();
    $.getJSON('img', function(data){
      for (var i=0; i<data.img.length; i++){
        var fname = data.img[i].fname;
        $('.slider').append('<div><img data-lazy="static/picture/' + fname + '"></div>');
      }
      defer.resolve();
    });
    return defer.promise();
  };

  
  var imgChange = function(nextSlide){
    console.log(nextSlide);
    if(nextSlide == 0){
      $('.slider').remove();
      $('body').append('<div class="slider">');
      var promise = rewiteImageList();
      promise.done(function() {
        $('.slider').on('beforeChange', function(event, slick, currentSlide, nextSlide){
            imgChange(nextSlide);
        });
        $('.slider').slick({
          autoplay: true,
          fade: true,
          speed: 5000,
          autoplaySpeed: 5000,
          dots: false,
          infinite: true,
          pauseOnHover: false,
          slideToShow: 1,
          centerMode: true,
          centerPadding: '0px',
        });
      });
    }
  };

  $('.slider').on('beforeChange', function(event, slick, currentSlide, nextSlide){
      imgChange(nextSlide);
  });
  $('.slider').slick({
    autoplay: true,
    fade: true,
    speed: 5000,
    autoplaySpeed: 5000,
    dots: false,
    infinite: true,
    pauseOnHover: false,
    slideToShow: 1,
    centerMode: true,
    centerPadding: '0px',
  });
}); 
</script>
</html>
