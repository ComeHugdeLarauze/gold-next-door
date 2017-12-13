const classCheck = (e) => {
  const d = e.currentTarget;
    if (e.target.classList.contains("image-picker")){
      d.classList.remove("init-class");
      d.removeEventListener("click", classCheck);
    };
};


const initPickTypeAbordage = () => {
  const d = document.getElementById("abordage_type_abordage");
  d.addEventListener("click", classCheck);
};

export { initPickTypeAbordage };
export { classCheck };
