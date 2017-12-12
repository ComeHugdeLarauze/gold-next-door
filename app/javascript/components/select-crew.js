function selectcrew () {
  $(document).ready(function(){
    const checks = document.querySelectorAll(".checkbox-crew");

    checks.forEach(function(label) {
      const input = label.querySelector("input");

      input.addEventListener('click', function(e){
        $(label).toggleClass("active");
      });
    });
  });
}

export {selectcrew};
