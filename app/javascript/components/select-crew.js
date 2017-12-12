function selectcrew () {
  $(document).ready(function(){
    $(".checkbox-crew").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export {selectcrew};
