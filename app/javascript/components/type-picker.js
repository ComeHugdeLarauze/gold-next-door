const classCheck = (e) => {
  const d = e.currentTarget;
    if (e.target.classList.contains("image-picker")){
      if (d.classList.contains("init-class")){
        d.classList.remove("init-class");
      }
    };
};


const initPickTypeAbordage = () => {
  const d = document.getElementById("abordage_type_abordage");
  d.addEventListener("click", classCheck);
};

export { initPickTypeAbordage };
export { classCheck };
