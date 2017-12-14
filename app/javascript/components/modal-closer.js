function refreshAbordageForm(){
  document.querySelectorAll(".to-reset").forEach((f) => f.value = "");
  document.querySelector(".to-reset-int").value = 1;
  if (!document.getElementById("abordage_type_abordage").classList.contains("init-class")){
    document.getElementById("abordage_type_abordage").classList.add("init-class");
  }
  document.querySelectorAll(".to-reset-radio").forEach((r) => r.checked = false);
  if (document.getElementById("new-abordage-modal-error").classList.contains("show-error")){
    document.getElementById("new-abordage-modal-error").classList.remove("show-error");
    document.getElementById("new-abordage-modal-error").classList.add("hide-error");
  }
}

const toggleModal = (e) => {
  const m = document.getElementById("new-abordage-modal");
  m.classList.toggle("modal-hidden");
  if(m.classList.contains("modal-hidden")){refreshAbordageForm()}
}


const initModal = () => {
 document.getElementById("new-abordage-modal_btn").addEventListener("click", toggleModal);
 document.getElementById("new-abordage-modal-background").addEventListener("click", toggleModal);
};

export {initModal};
