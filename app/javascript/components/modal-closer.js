const toggleModal = (e) => {
  const m = document.getElementById("new-abordage-modal");
  m.classList.toggle("modal-hidden");
}


const initModal = () => {
 document.getElementById("new-abordage-modal_btn").addEventListener("click", toggleModal);
 document.getElementById("new-abordage-modal-backgound").addEventListener("click", toggleModal);
};

export {initModal};
